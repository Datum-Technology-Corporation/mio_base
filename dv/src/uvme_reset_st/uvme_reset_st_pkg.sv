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


`ifndef __UVME_RESET_ST_PKG_SV__
`define __UVME_RESET_ST_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_hrtbt_macros.sv"
`include "uvml_logs_macros.sv"
`include "uvml_trn_macros.sv"
`include "uvml_sb_macros.sv"
`include "uvma_reset_macros.sv"
`include "uvme_reset_st_macros.sv"

// Interface(s) / Module(s) / Checker(s)
`ifdef UVME_RESET_ST_INC_CHKR
`include "uvme_reset_st_chkr.sv"
`endif


 /**
 * Encapsulates all the types needed for an UVM environment capable of
 * self-testing an Reset VIP.
 */
package uvme_reset_st_pkg;
   
   import uvm_pkg       ::*;
   import uvml_hrtbt_pkg::*;
   import uvml_logs_pkg ::*;
   import uvml_trn_pkg  ::*;
   import uvml_sb_pkg   ::*;
   import uvma_reset_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvme_reset_st_constants.sv"
   `include "uvme_reset_st_tdefs.sv"
   
   // Objects
   `include "uvme_reset_st_cfg.sv"
   `include "uvme_reset_st_cntxt.sv"
   
   // Environment components
   `include "uvme_reset_st_cov_model.sv"
   `include "uvme_reset_st_prd.sv"
   `include "uvme_reset_st_vsqr.sv"
   `include "uvme_reset_st_env.sv"
   
   // Virtual sequences
   `include "uvme_reset_st_vseq_lib.sv"
   
endpackage : uvme_reset_st_pkg


`endif // __UVME_RESET_ST_PKG_SV__
