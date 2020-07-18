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


`ifndef __UVME_RESET_ST_CNTXT_SV__
`define __UVME_RESET_ST_CNTXT_SV__


/**
 * Object encapsulating all state variables for Reset VIP
 * Self-Testing environment (uvme_reset_st_env_c) components.
 */
class uvme_reset_st_cntxt_c extends uvm_object;
   
   // Agent context handles
   uvma_reset_cntxt_c  active_cntxt;
   uvma_reset_cntxt_c  passive_cntxt;
   
   // Scoreboard context handle
   uvml_sb_cntxt_c  sb_cntxt;
   
   // Events
   uvm_event  sample_cfg_e  ;
   uvm_event  sample_cntxt_e;
   
   
   `uvm_object_utils_begin(uvme_reset_st_cntxt_c)
      `uvm_field_object(active_cntxt, UVM_DEFAULT)
      `uvm_field_object(passive_cntxt, UVM_DEFAULT)
      
      `uvm_field_object(sb_cntxt, UVM_DEFAULT)
      
      `uvm_field_event(sample_cfg_e  , UVM_DEFAULT)
      `uvm_field_event(sample_cntxt_e, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Builds events and sub-context objects.
    */
   extern function new(string name="uvme_reset_st_cntxt");
   
endclass : uvme_reset_st_cntxt_c


function uvme_reset_st_cntxt_c::new(string name="uvme_reset_st_cntxt");
   
   super.new(name);
   
   active_cntxt = uvma_reset_cntxt_c::type_id::create("active_cntxt");
   passive_cntxt = uvma_reset_cntxt_c::type_id::create("passive_cntxt");
   sb_cntxt        = uvml_sb_cntxt_c     ::type_id::create("sb_cntxt"       );
   
   sample_cfg_e   = new("sample_cfg_e"  );
   sample_cntxt_e = new("sample_cntxt_e");
   
endfunction : new


`endif // __UVME_RESET_ST_CNTXT_SV__
