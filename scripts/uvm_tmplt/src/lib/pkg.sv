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


`ifndef __UVML_${name_uppercase}_PKG_SV__
`define __UVML_${name_uppercase}_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_${name}_macros.sv"


/**
 * Encapsulates all the types needed for ${name_normal_case} library.
 */
package uvml_${name}_pkg;
   
   import uvm_pkg::*;
   
   // Constants / Structs / Enums
   `include "uvml_${name}_constants.sv"
   `include "uvml_${name}_tdefs.sv"
   
endpackage : uvml_${name}_pkg


`endif // __UVML_${name_uppercase}_PKG_SV__
