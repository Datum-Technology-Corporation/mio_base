// 
// Copyright 2020 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an “AS IS” BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 


`ifndef __UVML_TRN_PKG_SV__
`define __UVML_TRN_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_trn_macros.sv"


/**
 * Encapsulates all the types needed for Transactional Base Classes library.
 */
package uvml_trn_pkg;
   
   import uvm_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvml_trn_constants.sv"
   `include "uvml_trn_tdefs.sv"
  
   // Objects
   `include "uvml_trn_mon_trn.sv"
   `include "uvml_trn_seq_item.sv"
   
endpackage : uvml_trn_pkg


`endif // __UVML_TRN_PKG_SV__
