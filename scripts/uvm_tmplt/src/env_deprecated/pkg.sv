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


`ifndef __UVME_${name_uppercase}_PKG_SV__
`define __UVME_${name_uppercase}_PKG_SV__


// Pre-processor macros
`include "uvm_macros.svh"
`include "uvml_hrtbt_macros.sv"
`include "uvme_${name}_macros.sv"


 /**
 * Encapsulates all the types needed for an UVM environment capable of driving/
 * monitoring and verifying the behavior of an ${name_normal_case} design.
 */
package uvme_${name}_pkg;
  
  import uvm_pkg      ::*;
  import uvml_hrtbt_pkg::*;
  import uvml_sb_pkg   ::*;
  import uvma_${ral_agent_type}_pkg::*;
  import uvma_${reset_agent_type}_pkg::*;
  
  // Register Abstraction Layer
  `include "uvme_${name}_ral.sv"
  
  // Constants / Structs / Enums
  `include "uvme_${name}_constants.sv"
  `include "uvme_${name}_tdefs.sv"
  
  // Objects
  `include "uvme_${name}_cfg.sv"
  `include "uvme_${name}_cntxt.sv"
  
  // Predictor
  `include "uvme_${name}_prd.sv"
  
  // Environment components
  `include "uvme_${name}_cov_model.sv"
  `include "uvme_${name}_sb.sv"
  `include "uvme_${name}_vsqr.sv"
  `include "uvme_${name}_env.sv"
  
  // Virtual sequences
  `include "uvme_${name}_vseq_base.sv"
  `include "uvme_${name}_vseq_lib.sv"
  
endpackage : uvme_${name}_pkg


`endif // __UVME_${name_uppercase}_PKG_SV__
