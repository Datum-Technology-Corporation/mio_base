## 
## Copyright 2020 Datum Technology Corporation
## SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
## 
## Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may
## not use this file except in compliance with the License, or, at your option,
## the Apache License version 2.0. You may obtain a copy of the License at
## 
##     https://solderpad.org/licenses/SHL-2.1/
## 
## Unless required by applicable law or agreed to in writing, any work
## distributed under the License is distributed on an “AS IS” BASIS, WITHOUT
## WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
## License for the specific language governing permissions and limitations
## under the License.
## 



"""Design Verification \'Makefile\'.

Usage:
  dvm.py all  <target>
  dvm.py cmp  <target>
  dvm.py elab <target>
  dvm.py sim  <target>
  dvm.py clean
  dvm.py (-h | --help)
  dvm.py --version

Options:
  -h --help     Show this screen.
  --version     Show version.

"""



from docopt   import docopt
import os
import subprocess

dbg = True
vivado_path   = "C:/Xilinx/Vivado/2019.2/bin/"
uvm_dpi_so    = "uvm_dpi"
pwd           = os.getcwd()
project_dir   = pwd + "/.."
design_path   = project_dir + "/design"
rtl_path      = design_path + "/rtl"
rtl_libs_path = rtl_path + "/lib"
rtl_src_path  = rtl_path + "/src"
dv_path       = project_dir + "/dv"
dv_libs_path  = project_dir + "/../libs/new"
dv_src_path   = dv_path + "/src"



def do_dispatch(args):
    if (dbg):
        print("Call to do_dispatch()")
    do_paths()
    
    if args['all']:
        args['clean'] = True
        args['cmp'  ] = True
        args['elab' ] = True
        args['sim'  ] = True
    
    if args['clean']:
        do_clean()
    if args['cmp']:
        #do_cmp(dv_src_path + "/uvmt_axis_st/uvmt_axis_st.flist", "uvmt_axis_st")
        do_cmp(dv_src_path + "/uvmt_pkt_snf/uvmt_pkt_snf.flist", "uvmt_axis_st")
    if args['elab']:
        #do_elab("uvmt_axis_st", "uvmt_axis_st_tb")
        do_elab("uvmt_pkt_snf", "uvmt_pkt_snf_tb")
    if args['sim']:
        #do_sim("uvmt_axis_st_tb", "uvmt_axis_st_rand_traffic_test", 1, ["SIM_DIR_RESULTS=./"])
        do_sim("uvmt_pkt_snf_tb", "uvmt_pkt_snf_base_test", 1, ["SIM_DIR_RESULTS=" + pwd + "/"])



def do_paths():
    if (dbg):
        print("Call to do_paths()")
    
    ### RTL ###
    set_env_var("RTL_PKT_SNF_PATH", rtl_src_path + "/pkt_snf")
    
    ### DV ###
    # Libraries
    set_env_var("UVM_HOME"          , "C:/Users/DavidOuellet-Poulin/Documents/Libraries/1800.2-2017-1.0")
    set_env_var("DV_UVM_PATH"       , dv_libs_path + "/uvm"            )
    set_env_var("DV_UVML_HRTBT_PATH", dv_libs_path + "/uvml_hrtbt_v0p1")
    set_env_var("DV_UVML_TRN_PATH"  , dv_libs_path + "/uvml_trn_v0p1"  )
    set_env_var("DV_UVML_LOGS_PATH" , dv_libs_path + "/uvml_logs_v0p1" )
    set_env_var("DV_UVML_SB_PATH"   , dv_libs_path + "/uvml_sb_v0p1"   )
    set_env_var("DV_UVML_RAL_PATH"  , dv_libs_path + "/uvml_ral_v0p1"  )
    set_env_var("DV_UVMA_RESET_PATH", dv_libs_path + "/uvma_reset_v0p1")
    
    # Source
    set_env_var("DV_UVMA_APB_PATH"    , dv_src_path + "/uvma_apb"    )
    set_env_var("DV_UVMA_AXIS_PATH"   , dv_src_path + "/uvma_axis"   )
    set_env_var("DV_UVME_PKT_SNF_PATH", dv_src_path + "/uvme_pkt_snf")
    set_env_var("DV_UVME_AXIS_ST_PATH", dv_src_path + "/uvme_axis_st")
    set_env_var("DV_UVMT_PKT_SNF_PATH", dv_src_path + "/uvmt_pkt_snf")
    set_env_var("DV_UVMT_AXIS_ST_PATH", dv_src_path + "/uvmt_axis_st")



def set_env_var(name, value):
    if (dbg):
        print("Setting env var '" + name + "' to value '" + value + "'")
    os.environ[name] = value



def do_clean():
    if (dbg):
        print("Call to do_clean()")
    #os.rmdir(pwd + "/xsim.dir")



def do_cmp(filelist_path, lib_name):
    if (dbg):
        print("Call to do_cmp(filelist_path='" + filelist_path + "', lib_name='" + lib_name + "')")
    run_xsim_bin("xvlog", "-sv -f " + filelist_path + " -L uvm")



def do_elab(lib_name, design_unit):
    if (dbg):
        print("Call to do_elab(lib_name='" + lib_name + "', design_unit='" + design_unit + "')")
    run_xsim_bin("xelab", design_unit + " -relax --O0 -s " + design_unit + " -timescale 1ns/1ps")



def do_sim(snapshot, test_name, seed, args):
    act_args = "-testplusarg \"UVM_TESTNAME=" + test_name + "_c\""
    
    for arg in args:
        act_args = act_args + " -testplusarg \"" + arg + "\""
    
    if (dbg):
        print("Call to do_sim(snapshot='" + snapshot + "', test_name='" + test_name + "', seed='" + str(seed) + "', args='" + act_args + "')")
    
    run_xsim_bin("xsim", snapshot + " " + act_args + " -runall")



def run_xsim_bin(name, args):
    bin_path = vivado_path + name
    if (dbg):
        print("Call to run_xsim_bin(name='" + name + "', args='"  + args + "')")
        print("System call is " + bin_path + " " + args)
    subprocess.call(bin_path + " " + args, shell=True)



if __name__ == '__main__':
    args = docopt(__doc__, version='DVMake 0.1')
    if (dbg):
        print(args)
    do_dispatch(args)
