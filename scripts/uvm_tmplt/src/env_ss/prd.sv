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


`ifndef __UVME_${name_uppercase}_PRD_SV__
`define __UVME_${name_uppercase}_PRD_SV__


/**
 * Component implementing transaction-based software model of ${name_normal_case} DUT.
 */
class uvme_${name}_prd_c extends uvm_component;
   
   // Objects
   uvme_${name}_cfg_c    cfg;
   uvme_${name}_cntxt_c  cntxt;
   
   // Input TLM
   uvm_analysis_export  #(uvma_${ral_agent_type}_mon_trn_c)  ${ral_agent_type}_export;
   uvm_tlm_analysis_fifo#(uvma_${ral_agent_type}_mon_trn_c)  ${ral_agent_type}_fifo;
   uvm_analysis_export  #(uvma_${reset_agent_type}_mon_trn_c)  reset_export;
   uvm_tlm_analysis_fifo#(uvma_${reset_agent_type}_mon_trn_c)  reset_fifo;
   
   // Output TLM
   // TODO Add TLM outputs to uvme_${name}_prd_c
   //      Ex: uvm_analysis_port#(uvma_packet_trn_c)  pkts_out_ap;
   
   
   `uvm_component_utils_begin(uvme_${name}_prd_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_${name}_prd", uvm_component parent=null);
   
   /**
    * TODO Describe uvme_${name}_prd_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_${name}_prd_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_${name}_prd_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvme_${name}_prd_c::process_${ral_agent_type}()
    */
   extern task process_${ral_agent_type}();
   
   /**
    * TODO Describe uvme_${name}_prd_c::process_reset()
    */
   extern task process_reset();
   
endclass : uvme_${name}_prd_c


`pragma protect begin


function uvme_${name}_prd_c::new(string name="uvme_${name}_prd", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvme_${name}_prd_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvme_${name}_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvme_${name}_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   // Build Input TLM objects
   ${ral_agent_type}_export = new("${ral_agent_type}_export", this);
   ${ral_agent_type}_fifo   = new("${ral_agent_type}_fifo"  , this);
   reset_export = new("reset_export", this);
   reset_fifo   = new("reset_fifo"  , this);
   
   // Build Output TLM objects
   // TODO Create Output TLM objects for uvme_${name}_prd_c
   //      Ex: pkts_out_ap = new("pkts_out_ap", this);
   
endfunction : build_phase


function void uvme_${name}_prd_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   // Connect TLM objects
   ${ral_agent_type}_export.connect(${ral_agent_type}_fifo.analysis_export);
   reset_export.connect(reset_fifo.analysis_export);
   
endfunction: connect_phase


task uvme_${name}_prd_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   
   fork
      process_${ral_agent_type}();
      process_reset();
   join_none
   
endtask: run_phase


task uvme_${name}_prd_c::process_${ral_agent_type}();
   
   uvma_${ral_agent_type}_mon_trn_c  ${ral_agent_type}_trn;
   
   forever begin
      ${ral_agent_type}_fifo.get(${ral_agent_type}_trn);
      
      // TODO Implement uvme_${name}_prd_c::process_${ral_agent_type}()
   end
   
endtask : process_${ral_agent_type}


task uvme_${name}_prd_c::process_reset();
   
   uvma_${reset_agent_type}_mon_trn_c  reset_trn;
   
   forever begin
      reset_fifo.get(reset_trn);
      
      // TODO Implement uvme_${name}_prd_c::process_reset()
   end
   
endtask : process_reset


`pragma protect end


`endif // __UVME_${name_uppercase}_PRD_SV__
