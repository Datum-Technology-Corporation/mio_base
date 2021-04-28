// 
// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 


`ifndef __UVML_LOGS_PKG_SV__
`define __UVML_LOGS_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_logs_macros.sv"


/**
 * Encapsulates all the types needed for the Moore.io Logging Utilities library.
 */
package uvml_logs_pkg;
   
   import uvm_pkg     ::*;
   import uvml_trn_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvml_logs_constants.sv"
   `include "uvml_logs_tdefs.sv"
   
   // Components
   `include "uvml_logs_reg_logger_cbs.sv"
   `include "uvml_logs_reg_logger_json_cbs.sv"
   `include "uvml_logs_seq_item_logger.sv"
   `include "uvml_logs_mon_trn_logger.sv"
   `include "uvml_logs_rs_json.sv"
   `include "uvml_logs_rs_text.sv"
   
endpackage : uvml_logs_pkg


`include "uvml_logs_sim_summary.sv"


`endif // __UVML_LOGS_PKG_SV__
