// 
// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 


`ifndef __UVMA_CLK_DRV_SV__
`define __UVMA_CLK_DRV_SV__


/**
 * Component driving a Clock virtual interface (uvma_clk_if).
 */
class uvma_clk_drv_c extends uvm_driver#(
   .REQ(uvma_clk_seq_item_c),
   .RSP(uvma_clk_seq_item_c)
);
   
   // Objects
   uvma_clk_cfg_c    cfg;
   uvma_clk_cntxt_c  cntxt;
   
   // TLM
   uvm_analysis_port#(uvma_clk_seq_item_c)  ap;
   
   
   `uvm_component_utils_begin(uvma_clk_drv_c)
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_clk_drv", uvm_component parent=null);
   
   /**
    * 1. Ensures cfg & cntxt handles are not null.
    * 2. Builds ap.
    */
   extern virtual function void build_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvma_clk_drv_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);
   
   /**
    * TODO Describe uvma_clk_drv_c::drv_vif()
    */
   extern task drv_vif(uvm_phase phase);
   
   /**
    * TODO Describe uvma_clk_drv_c::drv_req()
    */
   extern task drv_req(ref uvma_clk_seq_item_c req);
   
   /**
    * TODO Describe uvma_clk_drv_c::action_start()
    */
   extern task action_start(ref uvma_clk_seq_item_c req);
   
   /**
    * TODO Describe uvma_clk_drv_c::action_stop()
    */
   extern task action_stop(ref uvma_clk_seq_item_c req);
   
   /**
    * TODO Describe uvma_clk_drv_c::action_pause()
    */
   extern task action_pause(ref uvma_clk_seq_item_c req);
   
   /**
    * TODO Describe uvma_clk_drv_c::action_chg_freq()
    */
   extern task action_chg_freq(ref uvma_clk_seq_item_c req);
   
   /**
    * TODO Describe uvma_clk_drv_c::clock_generator()
    */
   extern task clock_generator();
   
endclass : uvma_clk_drv_c


function uvma_clk_drv_c::new(string name="uvma_clk_drv", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvma_clk_drv_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvma_clk_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   uvm_config_db#(uvma_clk_cfg_c)::set(this, "*", "cfg", cfg);
   
   void'(uvm_config_db#(uvma_clk_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   uvm_config_db#(uvma_clk_cntxt_c)::set(this, "*", "cntxt", cntxt);
   
   ap = new("ap", this);
   
endfunction : build_phase


task uvma_clk_drv_c::run_phase(uvm_phase phase);
   
   super.run_phase(phase);
   
   drv_vif(phase);
   
endtask : run_phase


task uvma_clk_drv_c::drv_vif(uvm_phase phase);
   
   forever begin
      wait (cfg.enabled && cfg.is_active);
      seq_item_port.get_next_item(req);
      `uvml_hrtbt()
      
      drv_req (req);
      ap.write(req);
      seq_item_port.item_done();
   end
   
endtask : drv_vif


task uvma_clk_drv_c::drv_req(ref uvma_clk_seq_item_c req);
   
   case (req.action)
      UVMA_CLK_SEQ_ITEM_ACTION_START           : action_start   (req);
      UVMA_CLK_SEQ_ITEM_ACTION_STOP            : action_stop    (req);
      UVMA_CLK_SEQ_ITEM_ACTION_PAUSE           : action_pause   (req);
      UVMA_CLK_SEQ_ITEM_ACTION_CHANGE_FREQUENCY: action_chg_freq(req);
   endcase
   
endtask : drv_req


task uvma_clk_drv_c::action_start(ref uvma_clk_seq_item_c req);
   
   bit clock_running = 0;
   
   cntxt.drv_frequency = req.new_frequency;
   
   if (cntxt.clk_gen_process != null) begin
      if (cntxt.clk_gen_process.status() == process::RUNNING) begin
         clock_running = 1;
      end
   end
   
   if (!clock_running) begin
      fork
         clock_generator();
      join_none
   end
   
endtask : action_start


task uvma_clk_drv_c::action_stop(ref uvma_clk_seq_item_c req);
   
   cntxt.clk_gen_process.kill();
   
   case (req.stop_value)
      UVMA_CLK_SEQ_ITEM_STOP_VALUE_RANDOM: cntxt.vif.clk = $urandom_range(0,1);
      UVMA_CLK_SEQ_ITEM_STOP_VALUE_0     : cntxt.vif.clk = '0;
      UVMA_CLK_SEQ_ITEM_STOP_VALUE_1     : cntxt.vif.clk = '1;
      UVMA_CLK_SEQ_ITEM_STOP_VALUE_X     : cntxt.vif.clk = 'X;
      UVMA_CLK_SEQ_ITEM_STOP_VALUE_Z     : cntxt.vif.clk = 'Z;
   endcase
   
endtask : action_stop


task uvma_clk_drv_c::action_pause(ref uvma_clk_seq_item_c req);
   
   cntxt.clk_gen_process.suspend();
   
endtask : action_pause


task uvma_clk_drv_c::action_chg_freq(ref uvma_clk_seq_item_c req);
   
   cntxt.drv_frequency = $itor(req.new_frequency);
   
endtask : action_chg_freq


task uvma_clk_drv_c::clock_generator();
   
   realtime  period, period_duty_cycle_on, period_duty_cycle_off;
   
   cntxt.clk_gen_process = process::self();
   
   forever begin
      if (!(cntxt.vif.clk inside {1'b0, 1'b1})) begin
         cntxt.vif.clk = $urandom_range(0,1);
      end
      else begin
         cntxt.vif.clk = ~cntxt.vif.clk;
      end
      
      // We re-calculate each time because the frequency can change at any moment via a sequence item
      period = 1.0 / cntxt.drv_frequency;
      period_duty_cycle_on  = period * $itor(cfg.drv_duty_cycle)/100.0;
      period_duty_cycle_off = period - period_duty_cycle_on;
      
      if (cntxt.vif.clk === 1'b1) begin
         #(period_duty_cycle_on);
      end
      else begin
         #(period_duty_cycle_off);
      end
   end
   
endtask : clock_generator


`endif // __UVMA_CLK_DRV_SV__
