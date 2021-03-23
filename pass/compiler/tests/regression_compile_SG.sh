


#----------------------------------------- Pyrope start --------------------------------

#!/bin/bash

pts='if'


# Note: in this bash script, you MUST specify top module name AT FIRST POSITION
#pts_hier1='top sum top'
#pts_hier2='top top sum'


LGSHELL=./bazel-bin/main/lgshell
LGCHECK=./inou/yosys/lgcheck
PATTERN_PATH=./inou/pyrope/tests/compiler

if [ ! -f $LGSHELL ]; then
    if [ -f ./main/lgshell ]; then
        LGSHELL=./main/lgshell
        echo "lgshell is in $(pwd)"
    else
        echo "ERROR: could not find lgshell binary in $(pwd)";
    fi
fi


Pyrope_compile () {
  echo ""
  echo ""
  echo ""
  echo "===================================================="
  echo "Pyrope Full Compilation"
  echo "===================================================="


  for pt in $1
  do
    if [ ! -f ${PATTERN_PATH}/${pt}.prp ]; then
        echo "ERROR: could not find ${pt}.prp in ${PATTERN_PATH}"
        exit 1
    fi

    ${LGSHELL} "inou.pyrope files:${PATTERN_PATH}/${pt}.prp |> pass.compiler gviz:true top:${pt}"
    ret_val=$?
    if [ $ret_val -ne 0 ]; then
      echo "ERROR: could not compile with pattern: ${pt}.prp!"
      exit $ret_val
    fi
  done #end of for


  # Verilog code generation
  for pt in $1
  do
    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "LGraph -> Verilog"
    echo "----------------------------------------------------"

    ${LGSHELL} "lgraph.open name:${pt} |> inou.yosys.fromlg hier:true"
    if [ $? -eq 0 ] && [ -f ${pt}.v ]; then
        echo "Successfully generate Verilog: ${pt}.v"
        rm -f  yosys_script.*
    else
        echo "ERROR: Pyrope compiler failed: verilog generation, testcase: ${PATTERN_PATH}/${pt}.prp"
        exit 1
    fi
  done


  # Logic Equivalence Check
  for pt in $1
  do
      echo ""
      echo ""
      echo ""
      echo "----------------------------------------------------"
      echo "Logic Equivalence Check"
      echo "----------------------------------------------------"

      ${LGCHECK} --implementation=${pt}.v --reference=${PATTERN_PATH}/verilog_gld/${pt}.gld.v

      if [ $? -eq 0 ]; then
        echo "Successfully pass LEC!"
      else
          echo "FAIL: ${pt}.v !== ${pt}.gld.v"
          exit 1
      fi
  done
}


Pyrope_compile_hier () {
  echo ""
  echo ""
  echo ""
  echo "===================================================="
  echo "Hierarchical Pyrope Full Compilation"
  echo "===================================================="

  declare pts_concat
  declare top_module

  for pt in $1
  do
    if [ ! -f ${PATTERN_PATH}/${pt}.prp ]; then
        echo "ERROR: could not find ${pt}.prp in ${PATTERN_PATH}"
        exit 1
    fi

    # the first item in pts_hier is just specifying the top_module name
    if [ -z "${top_module}" ]; then
      top_module=${pt}
      continue
    fi

    # check if pts_concat is empty or not and perform pattern concatenation, patterns have to be comma seperated
    if [ -z "${pts_concat}" ]; then
      pts_concat="${PATTERN_PATH}/${pt}.prp"
    else
      pts_concat="${pts_concat}, ${PATTERN_PATH}/${pt}.prp"
    fi
  done


  ${LGSHELL} "inou.pyrope files:${pts_concat} |> pass.compiler gviz:true top:${top_module}"
  ret_val=$?
  if [ $ret_val -ne 0 ]; then
    echo "ERROR: could not compile with pattern: ${pts_concat}.prp!"
    exit $ret_val
  fi


  # Verilog code generation
  for pt in $1
  do
    echo ""
    echo ""
    echo ""
    echo "----------------------------------------------------"
    echo "LGraph -> Verilog"
    echo "----------------------------------------------------"

    # ${LGSHELL} "lgraph.open name:${pt} |> inou.yosys.fromlg hier:true"
    ${LGSHELL} "lgraph.open name:${pt} |> inou.yosys.fromlg"
    if [ $? -eq 0 ] && [ -f ${pt}.v ]; then
        echo "Successfully generate Verilog: ${pt}.v"
        rm -f  yosys_script.*
    else
        echo "ERROR: Pyrope compiler failed: verilog generation, testcase: ${PATTERN_PATH}/${pt}.prp"
        exit 1
    fi
  done

  #concatenate every submodule under top_module.v
  for pt in $1
  do
    if [[ pt != $top_module ]]; then
        $(cat ${pt}.v >> ${top_module}.v)
    fi
  done


  echo ""
  echo ""
  echo ""
  echo "----------------------------------------------------"
  echo "Logic Equivalence Check: Hierarchical Design"
  echo "----------------------------------------------------"

  ${LGCHECK} --top=$top_module --implementation=${top_module}.v --reference=./inou/pyrope/tests/compiler/verilog_gld/${top_module}.gld.v

  if [ $? -eq 0 ]; then
      echo "Successfully pass logic equivilence check!"
  else
      echo "FAIL: ${top_module}.v !== ${top_module}.gld.v"
      exit 1
  fi
}

#rm -rf ./lgdb
#Pyrope_compile_hier "$pts_hier1"
#rm -rf ./lgdb
#Pyrope_compile_hier "$pts_hier2"
rm -rf ./lgdb
Pyrope_compile "$pts"

#rm -f *.v
rm -f ./*.dot
rm -f ./lgcheck*

