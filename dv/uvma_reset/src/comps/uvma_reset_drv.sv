// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_RESET_DRV_SV__
`define __UVMA_RESET_DRV_SV__


/**
 * Component driving a Reset virtual interface (uvma_reset_if).
 */
class uvma_reset_drv_c extends uvm_driver#(
   .REQ(uvma_reset_seq_item_c),
   .RSP(uvma_reset_seq_item_c)
);
   
   // Objects
   uvma_reset_cfg_c    cfg;
   uvma_reset_cntxt_c  cntxt;
   
   // TLM
   uvm_analysis_port#(uvma_reset_seq_item_c)  ap;
   
   
   `uvm_component_utils_begin(uvma_reset_drv_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_drv", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null.
    * 2. Builds ap.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * Oversees driving, depending on the reset state, by calling drv_<pre|in|post>_reset() tasks.
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvma_reset_drv_c::drv_init_state()
    */
   extern virtual task drv_init_state();
   
   /**
    * Drives the virtual interface's (cntxt.vif) signals using req's contents.
    */
   extern virtual task drv_req(ref uvma_reset_seq_item_c req);
   
   /**
    * TODO Describe uvma_reset_drv_c::drv_req_synchronous()
    */
   extern virtual task drv_req_synchronous(ref uvma_reset_seq_item_c req);
   
   /**
    * TODO Describe uvma_reset_drv_c::drv_req_asynchronous()
    */
   extern virtual task drv_req_asynchronous(ref uvma_reset_seq_item_c req);
   
endclass : uvma_reset_drv_c


function uvma_reset_drv_c::new(string name="uvma_reset_drv", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_reset_drv_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_reset_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   uvm_config_db#(uvma_reset_cfg_c)::set(this, "*", "cfg", cfg);
   
   void'(uvm_config_db#(uvma_reset_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   uvm_config_db#(uvma_reset_cntxt_c)::set(this, "*", "cntxt", cntxt);
   
   ap = new("ap", this);
   
endfunction : build_phase


task uvma_reset_drv_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   
   drv_init_state();
   forever begin
      wait (cfg.enabled && cfg.is_active) begin
         seq_item_port.get_next_item(req);
         `uvml_hrtbt()
         drv_req (req);
         ap.write(req);
         seq_item_port.item_done();
      end
   end
   
endtask : run_phase


task uvma_reset_drv_c::drv_init_state();
   
   wait (cfg.enabled && cfg.is_active) begin
      case (cfg.drv_init_state)
         UVMA_RESET_DRV_INIT_STATE_DEASSERTED: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 1;
               UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 0;
               
               default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_DRV_INIT_STATE_ASSERTED  : begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 0;
               UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 1;
               
               default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_DRV_INIT_STATE_X: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 'X;
               UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 'X;
               
               default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         UVMA_RESET_DRV_INIT_STATE_Z: begin
            case (cfg.polarity)
               UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 'Z;
               UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 'Z;
               
               default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
            endcase
         end
         
         default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.reset_type: %s", cfg.reset_type.name()))
      endcase
   end
   
endtask : drv_init_state


task uvma_reset_drv_c::drv_req(ref uvma_reset_seq_item_c req);
   
   case (cfg.reset_type)
      UVMA_RESET_TYPE_SYNCHRONOUS : drv_req_synchronous (req);
      UVMA_RESET_TYPE_ASYNCHRONOUS: drv_req_asynchronous(req);
      
      default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.reset_type: %s", cfg.reset_type.name()))
   endcase
   
endtask : drv_req


task uvma_reset_drv_c::drv_req_synchronous(ref uvma_reset_seq_item_c req);
   
   @(cntxt.vif./*active_mp.*/drv_cb);
   case (cfg.polarity)
      UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif./*active_mp.*/drv_cb.reset_n <= 0;
      UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif./*active_mp.*/drv_cb.reset   <= 1;
      
      default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
   endcase
   
   repeat (req.duration) begin
      @(cntxt.vif./*active_mp.*/drv_cb);
   end
   
   case (cfg.polarity)
      UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif./*active_mp.*/drv_cb.reset_n <= 1;
      UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif./*active_mp.*/drv_cb.reset   <= 0;
      
      default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
   endcase
   
endtask : drv_req_synchronous


task uvma_reset_drv_c::drv_req_asynchronous(ref uvma_reset_seq_item_c req);
   
   case (cfg.polarity)
      UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 0;
      UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 1;
      
      default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
   endcase
   
   #(req.duration * 1ps);
   
   case (cfg.polarity)
      UVMA_RESET_POLARITY_ACTIVE_LOW : cntxt.vif.reset_n <= 1;
      UVMA_RESET_POLARITY_ACTIVE_HIGH: cntxt.vif.reset   <= 0;
      
      default: `uvm_fatal("RESET_DRV", $sformatf("Invalid cfg.polarity: %s", cfg.polarity.name()))
   endcase
   
endtask : drv_req_asynchronous


`endif // __UVMA_RESET_DRV_SV__
