#!/bin/bash
rm -rf ./lgdb

pts='nested_if tuple_if firrtl_tail tuple_if2 adder_stage if2 if3_err nested_if_err ssa_rhs logic if '
# pts='nested_if tuple_if tuple_if2 adder_stage if2 if3_err nested_if_err ssa_rhs logic if'

# pts='sync_cnt_nested_if bits_rhs'



LGSHELL=./bazel-bin/main/lgshell
LGCHECK=./inou/yosys/lgcheck

if [ ! -f $LGSHELL ]; then
    if [ -f ./main/lgshell ]; then
        LGSHELL=./main/lgshell
        echo "lgshell is in $(pwd)"
    else
        echo "ERROR: could not find lgshell binary in $(pwd)";
    fi
fi



echo ""
echo ""
echo ""
echo "===================================================="
echo "Pyrope Full Compilation (C++ Parser)"  
echo "===================================================="


for pt in $pts
do
    if [ ! -f inou/cfg/tests/${pt}.prp ]; then
      echo "ERROR: could not find ${pt}.prp in /inou/cfg/tests"
      exit !
    fi
    
    ln -s inou/cfg/tests/${pt}.prp;

   
    echo "----------------------------------------------------"
    echo "Pyrope -> LNAST-SSA Graphviz debug"  
    echo "----------------------------------------------------"

    ${LGSHELL} "inou.pyrope.dbg_lnast_ssa files:inou/cfg/tests/${pt}.prp |> inou.graphviz.from"
  
    if [ -f ${pt}.lnast.dot ]; then
      echo "Successfully create a lnast from inou/cfg/tests/${pt}.prp"
    else
      echo "ERROR: Pyrope compiler failed: LNAST generation, testcase: ${pt}.prp"
      exit 1
    fi

    echo "----------------------------------------------------"
    echo "Pyrope -> LNAST -> LGraph"  
    echo "----------------------------------------------------"
    
    # ${LGSHELL} "inou.lnast_dfg.tolg files:${pt}.cfg"
    ${LGSHELL} "inou.pyrope files:inou/cfg/tests/${pt}.prp |> inou.lnast_dfg.tolg"
    if [ $? -eq 0 ]; then
      echo "Successfully create the inital LGraph: inou/cfg/tests/${pt}.prp"
    else
      echo "ERROR: Pyrope compiler failed: LNAST -> LGraph, testcase: inou/cfg/tests/${pt}.prp"
      exit 1

    fi


    ${LGSHELL} "lgraph.open name:${pt} |> inou.graphviz.from verbose:false"
    mv ${pt}.dot ${pt}.no_bits.tuple.reduced_or.cpp.dot


    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "Reduced_Or_Op Elimination(LGraph)"  
    echo "----------------------------------------------------"
    ${LGSHELL} "lgraph.open name:${pt} |> inou.lnast_dfg.reduced_or_elimination"
    if [ $? -eq 0 ]; then
      echo "Successfully eliminate all reduced_or_op: inou/cfg/tests/${pt}.prp"
    else
      echo "ERROR: Pyrope compiler failed: reduced_or_elimination, testcase: inou/cfg/tests/${pt}.prp"
      exit 1
    fi

    ${LGSHELL} "lgraph.open name:${pt} |> inou.graphviz.from verbose:false"
    mv ${pt}.dot ${pt}.no_bits.tuple.cpp.dot


    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "Tuple Chain Resolve(LGraph)"  
    echo "----------------------------------------------------"
    ${LGSHELL} "lgraph.open name:${pt} |> inou.lnast_dfg.resolve_tuples"
    if [ $? -eq 0 ]; then
      echo "Successfully resolve the tuple chain: inou/cfg/tests/${pt}.prp"
    else
      echo "ERROR: Pyrope compiler failed: resolve tuples, testcase: inou/cfg/tests/${pt}.prp"
      exit 1
    fi

    ${LGSHELL} "lgraph.open name:${pt} |> inou.graphviz.from verbose:false"
    mv ${pt}.dot ${pt}.no_bits.cpp.dot

    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "Bitwidth Optimization(LGraph) Round-1"  
    echo "----------------------------------------------------"

    ${LGSHELL} "lgraph.open name:${pt} |> pass.bitwidth"
    if [ $? -eq 0 ]; then
      echo "Successfully optimize design bitwidth: inou/cfg/tests/${pt}.prp"
    else
      echo "ERROR: Pyrope compiler failed: bitwidth optimization, testcase: inou/cfg/tests/${pt}.prp"
      exit 1
    fi

    ${LGSHELL} "lgraph.open name:${pt} |> inou.graphviz.from verbose:false"

    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "Dead Code Elimination(LGraph)"  
    echo "----------------------------------------------------"
    echo "Todo ..."



    if [[ ${pt} == *_err* ]]; then 
        echo "----------------------------------------------------"
        echo "Pass! This is a Compile Error Test, No Need to Generate Verilog Code "  
        echo "----------------------------------------------------"
    else
        echo ""
        echo ""
        echo ""
        echo "----------------------------------------------------"
        echo "LGraph -> Verilog"  
        echo "----------------------------------------------------"

        ${LGSHELL} "lgraph.open name:${pt} |> inou.yosys.fromlg"
        if [ $? -eq 0 ] && [ -f ${pt}.v ]; then
          echo "Successfully generate Verilog: ${pt}.v"
          rm -f  yosys_script.*
        else
          echo "ERROR: Pyrope compiler failed: verilog generation, testcase: inou/cfg/tests/${pt}.prp"
          exit 1
        fi


        echo ""
        echo ""
        echo ""
        echo "----------------------------------------------------"
        echo "Logic Equivalence Check"  
        echo "----------------------------------------------------"

        ${LGCHECK} --implementation=${pt}.v --reference=./inou/cfg/tests/verilog_gld/${pt}.gld.v

        if [ $? -eq 0 ]; then
          echo "Successfully pass logic equivilence check!"
        else
          echo "FAIL: "${pt}".v !== "${pt}".gld.v"
          exit 1
        fi
    fi

    rm -f ${pt}.v
    rm -f ${pt}.prp
    rm -f lnast.dot.gld
    rm -f lnast.nodes
    rm -f lnast.nodes.gld
    # rm -f lnast.dot
    # rm -f *.dot
done #end of for