
��
����
RegisterReadDecode
clock" 
reset
�
io�*�
	iss_valid

�iss_uop�*�
uopc

inst
 

debug_inst
 
is_rvc

debug_pc
(
iq_type

fu_code


�ctrl�*�
br_type

op1_sel

op2_sel

imm_sel

op_fcn

fcn_dw

csr_cmd

is_load

is_sta

is_std

iw_state

iw_p1_poisoned

iw_p2_poisoned

is_br

is_jalr

is_jal

is_sfb

br_mask

br_tag

ftq_idx

	edge_inst

pc_lob

taken


imm_packed

csr_addr

rob_idx

ldq_idx

stq_idx

rxq_idx

pdst

prs1

prs2

prs3

ppred

	prs1_busy

	prs2_busy

	prs3_busy


ppred_busy


stale_pdst

	exception

	exc_cause
@

bypassable

mem_cmd

mem_size


mem_signed

is_fence

	is_fencei

is_amo

uses_ldq

uses_stq

is_sys_pc2epc

	is_unique

flush_on_commit

ldst_is_rs1

ldst

lrs1

lrs2

lrs3

ldst_val

	dst_rtype


lrs1_rtype


lrs2_rtype

frs3_en

fp_val

	fp_single


xcpt_pf_if


xcpt_ae_if


xcpt_ma_if

bp_debug_if


bp_xcpt_if


debug_fsrc


debug_tsrc

	rrd_valid

�rrd_uop�*�
uopc

inst
 

debug_inst
 
is_rvc

debug_pc
(
iq_type

fu_code


�ctrl�*�
br_type

op1_sel

op2_sel

imm_sel

op_fcn

fcn_dw

csr_cmd

is_load

is_sta

is_std

iw_state

iw_p1_poisoned

iw_p2_poisoned

is_br

is_jalr

is_jal

is_sfb

br_mask

br_tag

ftq_idx

	edge_inst

pc_lob

taken


imm_packed

csr_addr

rob_idx

ldq_idx

stq_idx

rxq_idx

pdst

prs1

prs2

prs3

ppred

	prs1_busy

	prs2_busy

	prs3_busy


ppred_busy


stale_pdst

	exception

	exc_cause
@

bypassable

mem_cmd

mem_size


mem_signed

is_fence

	is_fencei

is_amo

uses_ldq

uses_stq

is_sys_pc2epc

	is_unique

flush_on_commit

ldst_is_rs1

ldst

lrs1

lrs2

lrs3

ldst_val

	dst_rtype


lrs1_rtype


lrs2_rtype

frs3_en

fp_val

	fp_single


xcpt_pf_if


xcpt_ae_if


xcpt_ma_if

bp_debug_if


bp_xcpt_if


debug_fsrc


debug_tsrc
�
	

clock�
 �
	

reset�
 �


io�
 nzJ
#:!
:


iorrd_uop
debug_tsrc#:!
:


ioiss_uop
debug_tsrc�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
debug_fsrc#:!
:


ioiss_uop
debug_fsrc�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
bp_xcpt_if#:!
:


ioiss_uop
bp_xcpt_if�func-unit-decode.scala 320:16pzL
$:"
:


iorrd_uopbp_debug_if$:"
:


ioiss_uopbp_debug_if�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
xcpt_ma_if#:!
:


ioiss_uop
xcpt_ma_if�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
xcpt_ae_if#:!
:


ioiss_uop
xcpt_ae_if�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
xcpt_pf_if#:!
:


ioiss_uop
xcpt_pf_if�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	fp_single": 
:


ioiss_uop	fp_single�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopfp_val:
:


ioiss_uopfp_val�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopfrs3_en :
:


ioiss_uopfrs3_en�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
lrs2_rtype#:!
:


ioiss_uop
lrs2_rtype�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
lrs1_rtype#:!
:


ioiss_uop
lrs1_rtype�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	dst_rtype": 
:


ioiss_uop	dst_rtype�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopldst_val!:
:


ioiss_uopldst_val�func-unit-decode.scala 320:16bz>
:
:


iorrd_uoplrs3:
:


ioiss_uoplrs3�func-unit-decode.scala 320:16bz>
:
:


iorrd_uoplrs2:
:


ioiss_uoplrs2�func-unit-decode.scala 320:16bz>
:
:


iorrd_uoplrs1:
:


ioiss_uoplrs1�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopldst:
:


ioiss_uopldst�func-unit-decode.scala 320:16pzL
$:"
:


iorrd_uopldst_is_rs1$:"
:


ioiss_uopldst_is_rs1�func-unit-decode.scala 320:16xzT
(:&
:


iorrd_uopflush_on_commit(:&
:


ioiss_uopflush_on_commit�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	is_unique": 
:


ioiss_uop	is_unique�func-unit-decode.scala 320:16tzP
&:$
:


iorrd_uopis_sys_pc2epc&:$
:


ioiss_uopis_sys_pc2epc�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopuses_stq!:
:


ioiss_uopuses_stq�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopuses_ldq!:
:


ioiss_uopuses_ldq�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopis_amo:
:


ioiss_uopis_amo�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	is_fencei": 
:


ioiss_uop	is_fencei�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopis_fence!:
:


ioiss_uopis_fence�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
mem_signed#:!
:


ioiss_uop
mem_signed�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopmem_size!:
:


ioiss_uopmem_size�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopmem_cmd :
:


ioiss_uopmem_cmd�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
bypassable#:!
:


ioiss_uop
bypassable�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	exc_cause": 
:


ioiss_uop	exc_cause�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	exception": 
:


ioiss_uop	exception�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
stale_pdst#:!
:


ioiss_uop
stale_pdst�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
ppred_busy#:!
:


ioiss_uop
ppred_busy�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	prs3_busy": 
:


ioiss_uop	prs3_busy�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	prs2_busy": 
:


ioiss_uop	prs2_busy�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	prs1_busy": 
:


ioiss_uop	prs1_busy�func-unit-decode.scala 320:16dz@
:
:


iorrd_uopppred:
:


ioiss_uopppred�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopprs3:
:


ioiss_uopprs3�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopprs2:
:


ioiss_uopprs2�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopprs1:
:


ioiss_uopprs1�func-unit-decode.scala 320:16bz>
:
:


iorrd_uoppdst:
:


ioiss_uoppdst�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uoprxq_idx :
:


ioiss_uoprxq_idx�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopstq_idx :
:


ioiss_uopstq_idx�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopldq_idx :
:


ioiss_uopldq_idx�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uoprob_idx :
:


ioiss_uoprob_idx�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopcsr_addr!:
:


ioiss_uopcsr_addr�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
imm_packed#:!
:


ioiss_uop
imm_packed�func-unit-decode.scala 320:16dz@
:
:


iorrd_uoptaken:
:


ioiss_uoptaken�func-unit-decode.scala 320:16fzB
:
:


iorrd_uoppc_lob:
:


ioiss_uoppc_lob�func-unit-decode.scala 320:16lzH
": 
:


iorrd_uop	edge_inst": 
:


ioiss_uop	edge_inst�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopftq_idx :
:


ioiss_uopftq_idx�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopbr_tag:
:


ioiss_uopbr_tag�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopbr_mask :
:


ioiss_uopbr_mask�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopis_sfb:
:


ioiss_uopis_sfb�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopis_jal:
:


ioiss_uopis_jal�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopis_jalr :
:


ioiss_uopis_jalr�func-unit-decode.scala 320:16dz@
:
:


iorrd_uopis_br:
:


ioiss_uopis_br�func-unit-decode.scala 320:16vzR
':%
:


iorrd_uopiw_p2_poisoned':%
:


ioiss_uopiw_p2_poisoned�func-unit-decode.scala 320:16vzR
':%
:


iorrd_uopiw_p1_poisoned':%
:


ioiss_uopiw_p1_poisoned�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopiw_state!:
:


ioiss_uopiw_state�func-unit-decode.scala 320:16zzV
):'
:
:


iorrd_uopctrlis_std):'
:
:


ioiss_uopctrlis_std�func-unit-decode.scala 320:16zzV
):'
:
:


iorrd_uopctrlis_sta):'
:
:


ioiss_uopctrlis_sta�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlis_load*:(
:
:


ioiss_uopctrlis_load�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlcsr_cmd*:(
:
:


ioiss_uopctrlcsr_cmd�func-unit-decode.scala 320:16zzV
):'
:
:


iorrd_uopctrlfcn_dw):'
:
:


ioiss_uopctrlfcn_dw�func-unit-decode.scala 320:16zzV
):'
:
:


iorrd_uopctrlop_fcn):'
:
:


ioiss_uopctrlop_fcn�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlimm_sel*:(
:
:


ioiss_uopctrlimm_sel�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlop2_sel*:(
:
:


ioiss_uopctrlop2_sel�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlop1_sel*:(
:
:


ioiss_uopctrlop1_sel�func-unit-decode.scala 320:16|zX
*:(
:
:


iorrd_uopctrlbr_type*:(
:
:


ioiss_uopctrlbr_type�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopfu_code :
:


ioiss_uopfu_code�func-unit-decode.scala 320:16hzD
 :
:


iorrd_uopiq_type :
:


ioiss_uopiq_type�func-unit-decode.scala 320:16jzF
!:
:


iorrd_uopdebug_pc!:
:


ioiss_uopdebug_pc�func-unit-decode.scala 320:16fzB
:
:


iorrd_uopis_rvc:
:


ioiss_uopis_rvc�func-unit-decode.scala 320:16nzJ
#:!
:


iorrd_uop
debug_inst#:!
:


ioiss_uop
debug_inst�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopinst:
:


ioiss_uopinst�func-unit-decode.scala 320:16bz>
:
:


iorrd_uopuopc:
:


ioiss_uopuopc�func-unit-decode.scala 320:16�
�
rrd_cs�*�
br_type

use_alupipe

use_muldivpipe

use_mempipe

op_fcn

fcn_dw

op1_sel

op2_sel

imm_sel

rf_wen

csr_cmd
�func-unit-decode.scala 330:20Q27
_T1R/:
:


iorrd_uopuopc


25�Decode.scala 14:121S29
_T_11R/:
:


iorrd_uopuopc


26�Decode.scala 14:121S29
_T_21R/:
:


iorrd_uopuopc


28�Decode.scala 14:121:2!
_T_3R	

0

_T�Decode.scala 15:3092 
_T_4R

_T_3

_T_1�Decode.scala 15:3092 
_T_5R

_T_4

_T_2�Decode.scala 15:30S2:
_T_62R0:
:


iorrd_uopuopc

125�Decode.scala 14:65>2$
_T_7R

_T_6


24�Decode.scala 14:121S29
_T_81R/:
:


iorrd_uopuopc


29�Decode.scala 14:121<2#
_T_9R	

0

_T_7�Decode.scala 15:30:2!
_T_10R

_T_9

_T_8�Decode.scala 15:30T2:
_T_111R/:
:


iorrd_uopuopc


27�Decode.scala 14:121T2;
_T_122R0:
:


iorrd_uopuopc

126�Decode.scala 14:65@2&
_T_13R	

_T_12


28�Decode.scala 14:121>2%
_T_14R	

0	

_T_11�Decode.scala 15:30<2#
_T_15R	

_T_14	

_T_13�Decode.scala 15:3082"
_T_16R	

_T_10

_T_5�Cat.scala 29:58;2%
_T_17R	

0	

_T_15�Cat.scala 29:5892#
_T_18R	

_T_17	

_T_16�Cat.scala 29:58T2;
_T_192R0:
:


iorrd_uopuopc

125�Decode.scala 14:65A2'
_T_20R	

_T_19

101�Decode.scala 14:121T2;
_T_212R0:
:


iorrd_uopuopc

126�Decode.scala 14:65A2'
_T_22R	

_T_21

102�Decode.scala 14:121U2;
_T_232R0:
:


iorrd_uopuopc

104�Decode.scala 14:121>2%
_T_24R	

0	

_T_20�Decode.scala 15:30<2#
_T_25R	

_T_24	

_T_22�Decode.scala 15:30<2#
_T_26R	

_T_25	

_T_23�Decode.scala 15:3012
_T_27R	

_T_26�Decode.scala 40:35>2%
_T_28R	

0	

_T_20�Decode.scala 15:30<2#
_T_29R	

_T_28	

_T_22�Decode.scala 15:30<2#
_T_30R	

_T_29	

_T_23�Decode.scala 15:30S2:
_T_311R/:
:


iorrd_uopuopc


63�Decode.scala 14:65@2&
_T_32R	

_T_31


11�Decode.scala 14:121S2:
_T_331R/:
:


iorrd_uopuopc


62�Decode.scala 14:65@2&
_T_34R	

_T_33


12�Decode.scala 14:121T2;
_T_352R0:
:


iorrd_uopuopc

126�Decode.scala 14:65@2&
_T_36R	

_T_35


46�Decode.scala 14:121T2;
_T_372R0:
:


iorrd_uopuopc

124�Decode.scala 14:65@2&
_T_38R	

_T_37


48�Decode.scala 14:121S2:
_T_391R/:
:


iorrd_uopuopc


55�Decode.scala 14:65?2%
_T_40R	

_T_39	

6�Decode.scala 14:121S2:
_T_411R/:
:


iorrd_uopuopc


59�Decode.scala 14:65@2&
_T_42R	

_T_41


19�Decode.scala 14:121T2;
_T_432R0:
:


iorrd_uopuopc

111�Decode.scala 14:65?2%
_T_44R	

_T_43	

6�Decode.scala 14:121>2%
_T_45R	

0	

_T_32�Decode.scala 15:30<2#
_T_46R	

_T_45	

_T_34�Decode.scala 15:30<2#
_T_47R	

_T_46	

_T_36�Decode.scala 15:30<2#
_T_48R	

_T_47	

_T_38�Decode.scala 15:30<2#
_T_49R	

_T_48	

_T_40�Decode.scala 15:30<2#
_T_50R	

_T_49	

_T_42�Decode.scala 15:30<2#
_T_51R	

_T_50	

_T_44�Decode.scala 15:30S2:
_T_521R/:
:


iorrd_uopuopc


62�Decode.scala 14:65?2%
_T_53R	

_T_52	

6�Decode.scala 14:121S2:
_T_541R/:
:


iorrd_uopuopc


63�Decode.scala 14:65@2&
_T_55R	

_T_54


10�Decode.scala 14:121S2:
_T_561R/:
:


iorrd_uopuopc


63�Decode.scala 14:65@2&
_T_57R	

_T_56


12�Decode.scala 14:121T2;
_T_582R0:
:


iorrd_uopuopc

121�Decode.scala 14:65@2&
_T_59R	

_T_58


16�Decode.scala 14:121S2:
_T_601R/:
:


iorrd_uopuopc


59�Decode.scala 14:65@2&
_T_61R	

_T_60


25�Decode.scala 14:121T2:
_T_621R/:
:


iorrd_uopuopc


45�Decode.scala 14:121T2;
_T_632R0:
:


iorrd_uopuopc

126�Decode.scala 14:65@2&
_T_64R	

_T_63


48�Decode.scala 14:121S2:
_T_651R/:
:


iorrd_uopuopc


55�Decode.scala 14:65@2&
_T_66R	

_T_65


19�Decode.scala 14:121S2:
_T_671R/:
:


iorrd_uopuopc


55�Decode.scala 14:65@2&
_T_68R	

_T_67


16�Decode.scala 14:121>2%
_T_69R	

0	

_T_53�Decode.scala 15:30<2#
_T_70R	

_T_69	

_T_55�Decode.scala 15:30<2#
_T_71R	

_T_70	

_T_57�Decode.scala 15:30<2#
_T_72R	

_T_71	

_T_59�Decode.scala 15:30<2#
_T_73R	

_T_72	

_T_61�Decode.scala 15:30<2#
_T_74R	

_T_73	

_T_62�Decode.scala 15:30<2#
_T_75R	

_T_74	

_T_64�Decode.scala 15:30<2#
_T_76R	

_T_75	

_T_66�Decode.scala 15:30<2#
_T_77R	

_T_76	

_T_68�Decode.scala 15:30S2:
_T_781R/:
:


iorrd_uopuopc


57�Decode.scala 14:65@2&
_T_79R	

_T_78


17�Decode.scala 14:121S2:
_T_801R/:
:


iorrd_uopuopc


94�Decode.scala 14:65@2&
_T_81R	

_T_80


18�Decode.scala 14:121S2:
_T_821R/:
:


iorrd_uopuopc


54�Decode.scala 14:65@2&
_T_83R	

_T_82


18�Decode.scala 14:121S2:
_T_841R/:
:


iorrd_uopuopc


54�Decode.scala 14:65@2&
_T_85R	

_T_84


20�Decode.scala 14:121S2:
_T_861R/:
:


iorrd_uopuopc


61�Decode.scala 14:65?2%
_T_87R	

_T_86	

8�Decode.scala 14:121S2:
_T_881R/:
:


iorrd_uopuopc


59�Decode.scala 14:65?2%
_T_89R	

_T_88	

9�Decode.scala 14:121>2%
_T_90R	

0	

_T_53�Decode.scala 15:30<2#
_T_91R	

_T_90	

_T_79�Decode.scala 15:30<2#
_T_92R	

_T_91	

_T_81�Decode.scala 15:30<2#
_T_93R	

_T_92	

_T_83�Decode.scala 15:30<2#
_T_94R	

_T_93	

_T_85�Decode.scala 15:30<2#
_T_95R	

_T_94	

_T_87�Decode.scala 15:30<2#
_T_96R	

_T_95	

_T_89�Decode.scala 15:30S2:
_T_971R/:
:


iorrd_uopuopc


47�Decode.scala 14:65?2%
_T_98R	

_T_97	

9�Decode.scala 14:121S2:
_T_991R/:
:


iorrd_uopuopc


47�Decode.scala 14:65A2'
_T_100R	

_T_99


10�Decode.scala 14:121T2;
_T_1011R/:
:


iorrd_uopuopc


47�Decode.scala 14:65B2(
_T_102R


_T_101


12�Decode.scala 14:121T2;
_T_1031R/:
:


iorrd_uopuopc


94�Decode.scala 14:65B2(
_T_104R


_T_103


16�Decode.scala 14:121U2<
_T_1052R0:
:


iorrd_uopuopc

123�Decode.scala 14:65B2(
_T_106R


_T_105


18�Decode.scala 14:121T2;
_T_1071R/:
:


iorrd_uopuopc


60�Decode.scala 14:65B2(
_T_108R


_T_107


24�Decode.scala 14:121T2;
_T_1091R/:
:


iorrd_uopuopc


58�Decode.scala 14:65B2(
_T_110R


_T_109


24�Decode.scala 14:121?2&
_T_111R	

0	

_T_98�Decode.scala 15:30?2&
_T_112R


_T_111


_T_100�Decode.scala 15:30?2&
_T_113R


_T_112


_T_102�Decode.scala 15:30?2&
_T_114R


_T_113


_T_104�Decode.scala 15:30?2&
_T_115R


_T_114


_T_106�Decode.scala 15:30?2&
_T_116R


_T_115


_T_108�Decode.scala 15:30?2&
_T_117R


_T_116


_T_110�Decode.scala 15:30>2%
_T_118R


_T_117	

_T_62�Decode.scala 15:30:2$
_T_119R	

_T_77	

_T_51�Cat.scala 29:58;2%
_T_120R


_T_118	

_T_96�Cat.scala 29:58<2&
_T_121R


_T_120


_T_119�Cat.scala 29:58U2<
_T_1222R0:
:


iorrd_uopuopc

123�Decode.scala 14:65B2(
_T_123R


_T_122


43�Decode.scala 14:121U2<
_T_1242R0:
:


iorrd_uopuopc

124�Decode.scala 14:65B2(
_T_125R


_T_124


44�Decode.scala 14:121@2'
_T_126R	

0


_T_123�Decode.scala 15:30?2&
_T_127R


_T_126


_T_125�Decode.scala 15:30>2%
_T_128R


_T_127	

_T_38�Decode.scala 15:3032
_T_129R


_T_128�Decode.scala 40:35T2;
_T_1301R/:
:


iorrd_uopuopc


27�Decode.scala 14:65A2'
_T_131R


_T_130	

0�Decode.scala 14:121@2'
_T_132R	

0


_T_131�Decode.scala 15:30=2'
_T_133R	

0


_T_132�Cat.scala 29:58T2;
_T_1341R/:
:


iorrd_uopuopc


50�Decode.scala 14:65A2'
_T_135R


_T_134	

0�Decode.scala 14:121T2;
_T_1361R/:
:


iorrd_uopuopc


24�Decode.scala 14:65A2'
_T_137R


_T_136	

0�Decode.scala 14:121T2;
_T_1381R/:
:


iorrd_uopuopc


20�Decode.scala 14:65A2'
_T_139R


_T_138	

0�Decode.scala 14:121T2;
_T_1401R/:
:


iorrd_uopuopc


41�Decode.scala 14:65B2(
_T_141R


_T_140


32�Decode.scala 14:121T2;
_T_1421R/:
:


iorrd_uopuopc


35�Decode.scala 14:65B2(
_T_143R


_T_142


34�Decode.scala 14:121@2'
_T_144R	

0


_T_135�Decode.scala 15:30?2&
_T_145R


_T_144


_T_137�Decode.scala 15:30?2&
_T_146R


_T_145


_T_139�Decode.scala 15:30?2&
_T_147R


_T_146


_T_141�Decode.scala 15:30?2&
_T_148R


_T_147


_T_143�Decode.scala 15:30>2(
_T_149R	

0	

0�Cat.scala 29:58<2&
_T_150R


_T_149


_T_148�Cat.scala 29:58T2;
_T_1511R/:
:


iorrd_uopuopc


43�Decode.scala 14:65A2'
_T_152R


_T_151	

0�Decode.scala 14:121@2'
_T_153R	

0


_T_152�Decode.scala 15:30T2;
_T_1541R/:
:


iorrd_uopuopc


48�Decode.scala 14:65B2(
_T_155R


_T_154


16�Decode.scala 14:121@2'
_T_156R	

0


_T_152�Decode.scala 15:30?2&
_T_157R


_T_156


_T_155�Decode.scala 15:30=2'
_T_158R	

0


_T_157�Cat.scala 29:58<2&
_T_159R


_T_158


_T_153�Cat.scala 29:58T2;
_T_1601R/:
:


iorrd_uopuopc


56�Decode.scala 14:65A2'
_T_161R


_T_160	

8�Decode.scala 14:121T2;
_T_1621R/:
:


iorrd_uopuopc


91�Decode.scala 14:65B2(
_T_163R


_T_162


11�Decode.scala 14:121T2;
_T_1641R/:
:


iorrd_uopuopc


92�Decode.scala 14:65B2(
_T_165R


_T_164


12�Decode.scala 14:121T2;
_T_1661R/:
:


iorrd_uopuopc


92�Decode.scala 14:65B2(
_T_167R


_T_166


16�Decode.scala 14:121U2<
_T_1682R0:
:


iorrd_uopuopc

104�Decode.scala 14:65B2(
_T_169R


_T_168


72�Decode.scala 14:121U2<
_T_1702R0:
:


iorrd_uopuopc

120�Decode.scala 14:65B2(
_T_171R


_T_170


96�Decode.scala 14:121U2<
_T_1722R0:
:


iorrd_uopuopc

108�Decode.scala 14:65A2'
_T_173R


_T_172	

4�Decode.scala 14:121T2;
_T_1741R/:
:


iorrd_uopuopc


54�Decode.scala 14:65A2'
_T_175R


_T_174	

6�Decode.scala 14:121T2;
_T_1761R/:
:


iorrd_uopuopc


58�Decode.scala 14:65B2(
_T_177R


_T_176


16�Decode.scala 14:121T2;
_T_1781R/:
:


iorrd_uopuopc


60�Decode.scala 14:65B2(
_T_179R


_T_178


16�Decode.scala 14:121T2;
_T_1801R/:
:


iorrd_uopuopc


95�Decode.scala 14:65B2(
_T_181R


_T_180


72�Decode.scala 14:121@2'
_T_182R	

0


_T_161�Decode.scala 15:30?2&
_T_183R


_T_182


_T_163�Decode.scala 15:30?2&
_T_184R


_T_183


_T_165�Decode.scala 15:30?2&
_T_185R


_T_184


_T_167�Decode.scala 15:30?2&
_T_186R


_T_185


_T_169�Decode.scala 15:30?2&
_T_187R


_T_186


_T_171�Decode.scala 15:30?2&
_T_188R


_T_187


_T_173�Decode.scala 15:30?2&
_T_189R


_T_188


_T_175�Decode.scala 15:30?2&
_T_190R


_T_189


_T_177�Decode.scala 15:30?2&
_T_191R


_T_190


_T_179�Decode.scala 15:30>2%
_T_192R


_T_191	

_T_79�Decode.scala 15:30?2&
_T_193R


_T_192


_T_181�Decode.scala 15:30>2(
_T_194R	

0	

0�Cat.scala 29:58=2'
_T_195R


_T_194	

0�Cat.scala 29:58Gz$
:



rrd_csbr_type	

_T_18�func-unit-decode.scala 47:42Kz(
:



rrd_csuse_alupipe	

_T_27�func-unit-decode.scala 47:42Nz+
:



rrd_csuse_muldivpipe	

_T_30�func-unit-decode.scala 47:42Mz*
:



rrd_csuse_mempipe	

0�func-unit-decode.scala 47:42Gz$
:



rrd_csop_fcn


_T_121�func-unit-decode.scala 47:42Gz$
:



rrd_csfcn_dw


_T_129�func-unit-decode.scala 47:42Hz%
:



rrd_csop1_sel


_T_133�func-unit-decode.scala 47:42Hz%
:



rrd_csop2_sel


_T_150�func-unit-decode.scala 47:42Hz%
:



rrd_csimm_sel


_T_159�func-unit-decode.scala 47:42Gz$
:



rrd_csrf_wen


_T_193�func-unit-decode.scala 47:42Hz%
:



rrd_cscsr_cmd


_T_195�func-unit-decode.scala 47:42izE
*:(
:
:


iorrd_uopctrlbr_type:



rrd_csbr_type�func-unit-decode.scala 333:27izE
*:(
:
:


iorrd_uopctrlop1_sel:



rrd_csop1_sel�func-unit-decode.scala 334:27izE
*:(
:
:


iorrd_uopctrlop2_sel:



rrd_csop2_sel�func-unit-decode.scala 335:27izE
*:(
:
:


iorrd_uopctrlimm_sel:



rrd_csimm_sel�func-unit-decode.scala 336:27gzC
):'
:
:


iorrd_uopctrlop_fcn:



rrd_csop_fcn�func-unit-decode.scala 337:27T20
_T_196&R$:



rrd_csfcn_dw
0
0�func-unit-decode.scala 338:44[z7
):'
:
:


iorrd_uopctrlfcn_dw


_T_196�func-unit-decode.scala 338:27^2:
_T_1970R.:
:


iorrd_uopuopc	

1�func-unit-decode.scala 339:46\z8
*:(
:
:


iorrd_uopctrlis_load


_T_197�func-unit-decode.scala 339:27^2:
_T_1980R.:
:


iorrd_uopuopc	

2�func-unit-decode.scala 340:46_2;
_T_1991R/:
:


iorrd_uopuopc


67�func-unit-decode.scala 340:76J2&
_T_200R


_T_198


_T_199�func-unit-decode.scala 340:57[z7
):'
:
:


iorrd_uopctrlis_sta


_T_200�func-unit-decode.scala 340:27^2:
_T_2010R.:
:


iorrd_uopuopc	

3�func-unit-decode.scala 341:46e2@
_T_2026R4#:!
:


iorrd_uop
lrs2_rtype	

0� func-unit-decode.scala 341:109i2E
_T_203;R9):'
:
:


iorrd_uopctrlis_sta


_T_202�func-unit-decode.scala 341:84J2&
_T_204R


_T_201


_T_203�func-unit-decode.scala 341:57[z7
):'
:
:


iorrd_uopctrlis_std


_T_204�func-unit-decode.scala 341:27_2;
_T_2051R/:
:


iorrd_uopuopc


67�func-unit-decode.scala 343:25^2:
_T_2060R.:
:


iorrd_uopuopc	

1�func-unit-decode.scala 343:59a2=
_T_2073R1 :
:


iorrd_uopmem_cmd	

6�func-unit-decode.scala 343:91J2&
_T_208R


_T_206


_T_207�func-unit-decode.scala 343:69J2&
_T_209R


_T_205


_T_208�func-unit-decode.scala 343:39�:d



_T_209Vz2
#:!
:


iorrd_uop
imm_packed	

0�func-unit-decode.scala 344:27� func-unit-decode.scala 343:103X24
_T_210*R(:



rrd_cscsr_cmd	

6�func-unit-decode.scala 348:33X24
_T_211*R(:



rrd_cscsr_cmd	

7�func-unit-decode.scala 348:61J2&
_T_212R


_T_210


_T_211�func-unit-decode.scala 348:43^2:
_T_2130R.:
:


iorrd_uopprs1	

0�func-unit-decode.scala 348:82K2'
csr_renR


_T_212


_T_213�func-unit-decode.scala 348:72c2?
_T_214523

	
csr_ren	

2:



rrd_cscsr_cmd�func-unit-decode.scala 349:33\z8
*:(
:
:


iorrd_uopctrlcsr_cmd


_T_214�func-unit-decode.scala 349:27Rz.
:


io	rrd_valid:


io	iss_valid�func-unit-decode.scala 356:16
RegisterReadDecode