// 
// ${copyright_header}
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


`ifndef __UVMT_${name_uppercase}_PKG_SV__
`define __UVMT_${name_uppercase}_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_hrtbt_macros.sv"
`include "uvmt_${name}_macros.sv"

// Time units and precision for this test bench
timeunit       1ns;
timeprecision  1ps;

// Interface(s) / Module(s) / Checker(s)
`include "uvmt_${name}_clk_gen_if.sv"
`ifdef UVMT_${name_uppercase}_INC_DUT_CHKR
`include "uvmt_${name}_dut_chkr.sv"
`endif


/**
 * Encapsulates all the types and test cases for the verification of an
 * ${name_normal_case} RTL design.
 */
package uvmt_${name}_pkg;
   
   import uvm_pkg       ::*;
   import uvml_hrtbt_pkg::*;
   import uvml_logs_pkg ::*;
   import uvma_${ral_agent_type}_pkg::*;
   import uvma_${reset_agent_type}_pkg::*;
   import uvme_${name}_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvmt_${name}_constants.sv"
   `include "uvmt_${name}_tdefs.sv"
   
   // Virtual sequence library
   `include "uvmt_${name}_vseq_lib.sv"
   
   // Base tests
   `include "uvmt_${name}_test_cfg.sv"
   `include "uvmt_${name}_base_test.sv"
   
   // Functional tests
   `include "uvmt_${name}_reg_base_test.sv"
   `include "uvmt_${name}_reg_hw_reset_test.sv"
   `include "uvmt_${name}_reg_bit_bash_test.sv"
   
endpackage : uvmt_${name}_pkg


`endif // __UVMT_${name_uppercase}_PKG_SV__
