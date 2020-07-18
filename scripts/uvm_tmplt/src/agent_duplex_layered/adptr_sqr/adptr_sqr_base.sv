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


`ifndef __UVMA_${name_uppercase}_ADPTR_SQR_BASE_SV__
`define __UVMA_${name_uppercase}_ADPTR_SQR_BASE_SV__


/**
 * Abstract component from which all other ${name_normal_case} adapter sequencers must extend.
 */
class uvma_${name}_adptr_sqr_base_c#(
   type T_USQR = uvm_sequencer    ,
   type T_IN   = uvm_sequence_item,
   type T_OUT  = uvm_sequence_item
) extends uvm_sequencer#(
   .REQ(T_OUT),
   .RSP(T_OUT)
);
   
   // Objects
   uvma_${name}_cfg_c    cfg;
   uvma_${name}_cntxt_c  cntxt;
   
   // Handle to upstream sequencer
   T_USQR  upstrm_sqr;
   
   
   `uvm_component_param_utils_begin(uvma_${name}_adptr_sqr_base_c#(T_USQR, T_IN, T_OUT))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_${name}_adptr_sqr_base", uvm_component parent=null);
   
   /**
    * Ensures cfg & cntxt handles are not null.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
endclass : uvma_${name}_adptr_sqr_base_c


`pragma protect begin


function uvma_${name}_adptr_sqr_base_c::new(string name="uvma_${name}_adptr_sqr_base", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_${name}_adptr_sqr_base_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_${name}_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvma_${name}_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
endfunction : build_phase


`pragma protect end


`endif // __UVMA_${name_uppercase}_ADPTR_SQR_BASE_SV__
