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


`ifndef __UVME_${name_uppercase}_CNTXT_SV__
`define __UVME_${name_uppercase}_CNTXT_SV__


/**
 * Object encapsulating all state variables for ${name_normal_case} environment
 * (uvme_${name}_env_c) components.
 */
class uvme_${name}_cntxt_c extends uvm_object;
  
  // Agent context handles
  uvma_${ral_agent_type}_cntxt_c  ${ral_agent_type}_cntxt;
  uvma_${reset_agent_type}_cntxt_c  reset_cntxt;
  
  // TODO Add scoreboard cntxt handles
  //      Ex: uvm_sb_cntxt_c  sb_egress_cntxt;
  //          uvm_sb_cntxt_c  sb_ingress_cntxt;
  
  // Events
  uvm_event  sample_cfg_e;
  uvm_event  sample_cntxt_e;
  
  
  `uvm_object_utils_begin(uvme_${name}_cntxt_c)
    `uvm_field_object(${ral_agent_type}_cntxt, UVM_DEFAULT)
    `uvm_field_object(reset_cntxt, UVM_DEFAULT)
    
    // TODO Add scoreboard cntxt field macros
    //      Ex: `uvm_field_object(sb_egress_cntxt , UVM_DEFAULT)
    //          `uvm_field_object(sb_ingress_cntxt, UVM_DEFAULT)
    
    `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
    `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
  `uvm_object_utils_end
  
  
  /**
   * Builds events and sub-context objects.
   */
  extern function new(string name="uvme_${name}_cntxt");
  
endclass : uvme_${name}_cntxt_c


`pragma protect begin


function uvme_${name}_cntxt_c::new(string name="uvme_${name}_cntxt");
  
  super.new(name);
  
  ${ral_agent_type}_cntxt = uvma_${ral_agent_type}_cntxt_c::type_id::create("${ral_agent_type}_cntxt");
  reset_cntxt = uvma_${reset_agent_type}_cntxt_c::type_id::create("reset_cntxt");
  
  sample_cfg_e   = new("sample_cfg_e"  );
  sample_cntxt_e = new("sample_cntxt_e");
  
endfunction : new


`pragma protect end


`endif // __UVME_${name_uppercase}_CNTXT_SV__
