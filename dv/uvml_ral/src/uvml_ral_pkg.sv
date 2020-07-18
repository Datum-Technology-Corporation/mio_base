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


`ifndef __UVML_RAL_PKG_SV__
`define __UVML_RAL_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_ral_macros.sv"


/**
 * Encapsulates all the types needed for the Register Abstraction Layer library.
 */
package uvml_ral_pkg;
   
   import uvm_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvml_ral_constants.sv"
   `include "uvml_ral_tdefs.sv"
   
   // Objects
   `include "uvml_ral_reg_field.sv"
   `include "uvml_ral_reg.sv"
   `include "uvml_ral_reg_block.sv"
   
endpackage : uvml_ral_pkg


`endif // __UVML_RAL_PKG_SV__
