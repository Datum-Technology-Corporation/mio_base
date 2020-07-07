## 
## Copyright 2020 Datum Technology Corporation
## 
## Licensed under the Solderpad Hardware License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
## 
##     https://solderpad.org/licenses/
## 
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.


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
        #do_cmp(dv_src_path + "/uvmt_reset_st/uvmt_reset_st.flist", "uvmt_reset_st")
        do_cmp(dv_src_path + "/uvmt_apb_st/uvmt_apb_st.flist", "uvmt_apb_st")
    if args['elab']:
        #do_elab("uvmt_reset_st", "uvmt_reset_st_tb")
        do_elab("uvmt_apb_st", "uvmt_apb_st_tb")
    if args['sim']:
        #do_sim("uvmt_reset_st_tb", "uvmt_reset_st_rand_pulses_test", 1, ["SIM_DIR_RESULTS=" + pwd + "/"])
        do_sim("uvmt_apb_st_tb", "uvmt_apb_st_rand_access_test", 1, ["SIM_DIR_RESULTS=" + pwd + "/"])



def do_paths():
    if (dbg):
        print("Call to do_paths()")
    
    ### DV ###
    # Libraries
    set_env_var("UVM_HOME"             , "C:/Users/DavidOuellet-Poulin/Documents/Libraries/1800.2-2017-1.0")
    set_env_var("DV_UVM_PATH"          , dv_src_path + "/uvm"          )
    set_env_var("DV_UVML_HRTBT_PATH"   , dv_src_path + "/uvml_hrtbt"   )
    set_env_var("DV_UVML_TRN_PATH"     , dv_src_path + "/uvml_trn"     )
    set_env_var("DV_UVML_LOGS_PATH"    , dv_src_path + "/uvml_logs"    )
    set_env_var("DV_UVML_SB_PATH"      , dv_src_path + "/uvml_sb"      )
    set_env_var("DV_UVML_RAL_PATH"     , dv_src_path + "/uvml_ral"     )
    # Agents
    set_env_var("DV_UVMA_RESET_PATH"   , dv_src_path + "/uvma_reset"   )
    set_env_var("DV_UVME_RESET_ST_PATH", dv_src_path + "/uvme_reset_st")
    set_env_var("DV_UVMT_RESET_ST_PATH", dv_src_path + "/uvmt_reset_st")
    set_env_var("DV_UVMA_APB_PATH"     , dv_src_path + "/uvma_apb"     )
    set_env_var("DV_UVME_APB_ST_PATH"  , dv_src_path + "/uvme_apb_st"  )
    set_env_var("DV_UVMT_APB_ST_PATH"  , dv_src_path + "/uvmt_apb_st"  )
    set_env_var("DV_UVMA_AXIS_PATH"    , dv_src_path + "/uvma_axis"    )
    set_env_var("DV_UVME_AXIS_ST_PATH" , dv_src_path + "/uvme_axis_st" )
    set_env_var("DV_UVMT_AXIS_ST_PATH" , dv_src_path + "/uvmt_axis_st" )



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
    run_xsim_bin("xelab", design_unit + " -relax --O0 -s " + design_unit + " -timescale 1ns/1ps -debug all")



def do_sim(snapshot, test_name, seed, args):
    act_args = "-testplusarg \"UVM_TESTNAME=" + test_name + "_c\""
    
    for arg in args:
        act_args = act_args + " -testplusarg \"" + arg + "\""
    
    if (dbg):
        print("Call to do_sim(snapshot='" + snapshot + "', test_name='" + test_name + "', seed='" + str(seed) + "', args='" + act_args + "')")
    
    run_xsim_bin("xsim", snapshot + " " + act_args + " -runall -wdb waves.wdb")
    #run_xsim_bin("xsim", snapshot + " " + act_args + " -g -wdb waves.wdb")



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
