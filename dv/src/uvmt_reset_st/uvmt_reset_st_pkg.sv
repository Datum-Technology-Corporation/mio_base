// 
// Copyright 2020 Datum Technology Corporation
// 
// Licensed under the Solderpad Hardware License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// 


`ifndef __UVMT_RESET_ST_PKG_SV__
`define __UVMT_RESET_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_hrtbt_macros.sv"
`include "uvml_logs_macros.sv"
`include "uvml_sb_macros.sv"
`include "uvml_trn_macros.sv"
`include "uvma_reset_macros.sv"
`include "uvme_reset_st_macros.sv"
`include "uvmt_reset_st_macros.sv"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s) / Module(s) / Checker(s)
`include "uvmt_reset_st_clk_gen_if.sv"
`ifdef UVMT_RESET_ST_INC_DUT_CHKR
`include "uvmt_reset_st_dut_chkr.sv"
`endif


/**
 * Encapsulates all the types and test cases for self-testing an
 * Reset VIP.
 */
package uvmt_reset_st_pkg;
   
   import uvm_pkg          ::*;
   import uvml_hrtbt_pkg   ::*;
   import uvml_logs_pkg    ::*;
   import uvml_sb_pkg      ::*;
   import uvml_trn_pkg     ::*;
   import uvma_reset_pkg   ::*;
   import uvme_reset_st_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvmt_reset_st_constants.sv"
   `include "uvmt_reset_st_tdefs.sv"
   
   // Virtual sequence library
   `include "uvmt_reset_st_vseq_lib.sv"
   
   // Base test
   `include "uvmt_reset_st_test_cfg.sv"
   `include "uvmt_reset_st_base_test.sv"
   
   // Functional tests
   `include "uvmt_reset_st_rand_pulses_test.sv"
   
endpackage : uvmt_reset_st_pkg


`endif // __UVMT_RESET_ST_PKG_SV__
