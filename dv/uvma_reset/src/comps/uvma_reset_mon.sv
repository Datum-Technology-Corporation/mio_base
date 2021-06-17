// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_RESET_MON_SV__
`define __UVMA_RESET_MON_SV__


/**
 * Component sampling transactions from a Reset virtual interface
 * (uvma_reset_if).
 */
class uvma_reset_mon_c extends uvm_monitor;
   
   // Objects
   uvma_reset_cfg_c    cfg;
   uvma_reset_cntxt_c  cntxt;
   
   // TLM
   uvm_analysis_port#(uvma_reset_mon_trn_c)  ap;
   
   
   `uvm_component_utils_begin(uvma_reset_mon_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_mon", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null.
    * 2. Builds ap.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * Oversees monitoring, depending on the reset state, by calling mon_<pre|in|post>_reset() tasks.
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * Creates trn by sampling the virtual interface's (cntxt.vif) signals.
    */
   extern task sample_trn(output uvma_reset_mon_trn_c trn);
   
   /**
    * Creates trn by sampling the virtual interface's (cntxt.vif) signals.
    */
   extern task sample_trn_synchronous(output uvma_reset_mon_trn_c trn);
   
   /**
    * Creates trn by sampling the virtual interface's (cntxt.vif) signals.
    */
   extern task sample_trn_asynchronous(output uvma_reset_mon_trn_c trn);
   
   /**
    * TODO Describe uvma_reset_mon_c::process_trn()
    */
   extern function void process_trn(ref uvma_reset_mon_trn_c trn);
   
endclass : uvma_reset_mon_c


function uvma_reset_mon_c::new(string name="uvma_reset_mon", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_reset_mon_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_reset_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvma_reset_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   ap = new("ap", this);
  
endfunction : build_phase


task uvma_reset_mon_c::run_phase(uvm_phase phase);
   
   uvma_reset_mon_trn_c  trn;
   
   super.run_phase(phase);
   
   forever begin
      wait (cfg.enabled) begin
         sample_trn (trn);
         process_trn(trn);
         ap.write   (trn);
         `uvml_hrtbt()
      end
   end
   
endtask : run_phase


task uvma_reset_mon_c::sample_trn(output uvma_reset_mon_trn_c trn);
   
   case (cfg.reset_type)
      UVMA_RESET_TYPE_SYNCHRONOUS : sample_trn_synchronous (trn);
      UVMA_RESET_TYPE_ASYNCHRONOUS: sample_trn_asynchronous(trn);
      
      default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.reset_type: %s", cfg.reset_type.name()))
   endcase
   
endtask : sample_trn


task uvma_reset_mon_c::sample_trn_synchronous(output uvma_reset_mon_trn_c trn);
   
   bit  sampled_trn = 0;
   
   trn = uvma_reset_mon_trn_c::type_id::create("trn");
   trn.__originator = this.get_full_name();
   
   do begin
      @(cntxt.vif./*passive_mp.*/mon_cb);
      case (cntxt.reset_state)
         UVMA_RESET_STATE_PRE_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset_n === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                     trn.num_cycles++;
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                     trn.num_cycles++;
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_STATE_IN_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset_n === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_POST_RESET;
                     trn.__timestamp_end = $realtime();
                     sampled_trn       = 1;
                  end
                  else begin
                     trn.num_cycles++;
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_POST_RESET;
                     trn.__timestamp_end = $realtime();
                     sampled_trn       = 1;
                  end
                  else begin
                     trn.num_cycles++;
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_STATE_POST_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset_n === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                     trn.num_cycles++;
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  if (cntxt.vif./*passive_mp.*/mon_cb.reset === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                     trn.num_cycles++;
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         default: `uvm_fatal("RESET_MON", $sformatf("Invalid cntxt.reset_state: %s", cntxt.reset_state.name()))
      endcase
   end while (!sampled_trn);
   
endtask : sample_trn_synchronous


task uvma_reset_mon_c::sample_trn_asynchronous(output uvma_reset_mon_trn_c trn);
   
   bit  sampled_trn = 0;
   
   trn = uvma_reset_mon_trn_c::type_id::create("trn");
   trn.__originator = this.get_full_name();
   
   do begin
      case (cntxt.reset_state)
         UVMA_RESET_STATE_PRE_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  wait (cntxt.vif.reset_n === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  wait (cntxt.vif.reset === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_STATE_IN_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  wait (cntxt.vif.reset_n === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_POST_RESET;
                     trn.__timestamp_end = $realtime();
                     sampled_trn       = 1;
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  wait (cntxt.vif.reset === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_POST_RESET;
                     trn.__timestamp_end = $realtime();
                     sampled_trn       = 1;
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_STATE_POST_RESET: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : begin
                  wait (cntxt.vif.reset_n === 0) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                  end
               end
               
               UVMA_RESET_POLARITY_ACTIVE_HIGH: begin
                  wait (cntxt.vif.reset === 1) begin
                     cntxt.reset_state = UVMA_RESET_STATE_IN_RESET;
                     trn.__timestamp_start = $realtime();
                  end
               end
               
               default: `uvm_fatal("RESET_MON", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         default: `uvm_fatal("RESET_MON", $sformatf("Invalid cntxt.reset_state: %s", cntxt.reset_state.name()))
      endcase
   end while (!sampled_trn);
   
endtask : sample_trn_asynchronous


function void uvma_reset_mon_c::process_trn(ref uvma_reset_mon_trn_c trn);
   
   trn.duration = trn.__timestamp_end - trn.__timestamp_start;
   
endfunction : process_trn


`endif // __UVMA_RESET_MON_SV__
