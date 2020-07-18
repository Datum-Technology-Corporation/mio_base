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


`ifndef __UVME_${name_uppercase}_ST_CNTXT_SV__
`define __UVME_${name_uppercase}_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for ${name_normal_case} VIP
 * Self-Testing environment (uvme_${name}_st_env_c) components.
 */
class uvme_${name}_st_cntxt_c extends uvm_object;
   
   // Agent context handles
   uvma_${name}_cntxt_c  ${name_1}_cntxt;
   uvma_${name}_cntxt_c  ${name_2}_cntxt;
   
   // Scoreboard context handles
   uvml_sb_cntxt_c  sb_${name_1}_cntxt;
   uvml_sb_cntxt_c  sb_${name_2}_cntxt;
   
   // Events
   uvm_event  sample_cfg_e  ;
   uvm_event  sample_cntxt_e;
   
   
   `uvm_object_utils_begin(uvme_${name}_st_cntxt_c)
      `uvm_field_object(${name_1}_cntxt, UVM_DEFAULT)
      `uvm_field_object(${name_2}_cntxt, UVM_DEFAULT)
      
      `uvm_field_object(sb_${name_1}_cntxt, UVM_DEFAULT)
      `uvm_field_object(sb_${name_2}_cntxt, UVM_DEFAULT)
      
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_${name}_st_cntxt");
   
endclass : uvme_${name}_st_cntxt_c


`pragma protect begin


function uvme_${name}_st_cntxt_c::new(string name="uvme_${name}_st_cntxt");
   
   super.new(name);
   
   ${name_1}_cntxt = uvma_${name}_cntxt_c::type_id::create("${name_1}_cntxt");
   ${name_2}_cntxt = uvma_${name}_cntxt_c::type_id::create("${name_2}_cntxt");
   
   sb_${name_1}_cntxt = uvml_sb_cntxt_c::type_id::create("sb_${name_1}_cntxt");
   sb_${name_2}_cntxt = uvml_sb_cntxt_c::type_id::create("sb_${name_2}_cntxt");
   
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


`pragma protect end


`endif // __UVME_${name_uppercase}_ST_CNTXT_SV__
