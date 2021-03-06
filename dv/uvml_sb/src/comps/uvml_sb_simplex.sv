// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVML_SB_SIMPLEX_SV__
`define __UVML_SB_SIMPLEX_SV__


/**
 * Scoreboard comparing expected and actual packet stream to/from DUT.
 */
class uvml_sb_simplex_c#(
   type T_ACT_TRN  = uvm_object,
   type T_EXP_TRN  = T_ACT_TRN
) extends uvm_scoreboard;
   
   // Objects
   uvml_sb_cfg_c    cfg;
   uvml_sb_cntxt_c  cntxt;
   
   // TLM
   uvm_analysis_export  #(T_ACT_TRN)  act_export;
   uvm_analysis_export  #(T_EXP_TRN)  exp_export;
   uvm_tlm_analysis_fifo#(T_ACT_TRN)  act_fifo;
   uvm_tlm_analysis_fifo#(T_EXP_TRN)  exp_fifo;
   
   
   `uvm_component_param_utils_begin(uvml_sb_simplex_c#(T_ACT_TRN, T_EXP_TRN))
      `uvm_field_object(cfg  , UVM_DEFAULT)
      `uvm_field_object(cntxt, UVM_DEFAULT)
   `uvm_component_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_sb_simplex", uvm_component parent=null);

   /**
    * TODO Describe uvml_sb_simplex_c::build_phase()
    */
   extern virtual function void build_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::connect_phase()
    */
   extern virtual function void connect_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::run_phase()
    */
   extern virtual task run_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::check_phase()
    */
   extern virtual function void check_phase(uvm_phase phase);

   /**
    * TODO Describe uvml_sb_simplex_c::mode_in_order()
    */
   extern task mode_in_order();

   /**
    * TODO Describe uvml_sb_simplex_c::mode_out_of_order()
    */
   extern task mode_out_of_order();
   
   /**
    * TODO Describe uvml_sb_simplex_c::get_act()
    */
   extern task get_act(output T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::get_exp()
    */
   extern task get_exp(output T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::calc_act_stats()
    */
   extern virtual function void calc_act_stats(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::calc_exp_stats()
    */
   extern virtual function void calc_exp_stats(ref T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_new_act()
    */
   extern virtual function void log_new_act(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_new_exp()
    */
   extern virtual function void log_new_exp(ref T_EXP_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_act_before_exp()
    */
   extern virtual function void log_act_before_exp(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_match()
    */
   extern virtual function void log_match(ref T_ACT_TRN act_trn, T_EXP_TRN exp_trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_mismatch()
    */
   extern virtual function void log_mismatch(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::log_drop()
    */
   extern virtual function void log_drop(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   /**
    * TODO Describe uvml_sb_simplex_c::on_new_act()
    */
   extern virtual task on_new_act(ref T_ACT_TRN trn);
   
   /**
    * TODO Describe uvml_sb_simplex_c::on_new_exp()
    */
   extern virtual task on_new_exp(ref T_EXP_TRN trn);
   
endclass : uvml_sb_simplex_c


function uvml_sb_simplex_c::new(string name="uvml_sb_simplex", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


function void uvml_sb_simplex_c::build_phase(uvm_phase phase);
   
   super.build_phase(phase);
   
   void'(uvm_config_db#(uvml_sb_cfg_c)::get(this, "", "cfg", cfg));
   if (!cfg) begin
      `uvm_fatal("CFG", "Configuration handle is null")
   end
   
   void'(uvm_config_db#(uvml_sb_cntxt_c)::get(this, "", "cntxt", cntxt));
   if (!cntxt) begin
      `uvm_fatal("CNTXT", "Context handle is null")
   end
   
   // Build TLM objects
   act_export  = new("act_export", this);
   exp_export  = new("exp_export", this);
   act_fifo    = new("act_fifo"  , this);
   exp_fifo    = new("exp_fifo"  , this);
   
endfunction : build_phase


function void uvml_sb_simplex_c::connect_phase(uvm_phase phase);
   
   super.connect_phase(phase);
   
   // Connect TLM objects
   act_export.connect(act_fifo.analysis_export);
   exp_export.connect(exp_fifo.analysis_export);
   
endfunction: connect_phase


task uvml_sb_simplex_c::run_phase(uvm_phase phase);
   
   T_EXP_TRN  exp_trn;
   
   super.run_phase(phase);
   
   if (cfg.enabled) begin
      fork
         forever begin
            case (cfg.mode)
               UVML_SB_MODE_IN_ORDER    : mode_in_order    ();
               UVML_SB_MODE_OUT_OF_ORDER: mode_out_of_order();
                
               default: begin
                  `uvm_error("SB", $sformatf("Invalid cfg.mode:%0d", cfg.mode))
               end
            endcase
         end
         
         forever begin
            get_exp       (exp_trn);
            calc_exp_stats(exp_trn);
            log_new_exp   (exp_trn);
         end
      join_none
   end
   
endtask: run_phase


function void uvml_sb_simplex_c::check_phase(uvm_phase phase);
   
   if (cfg.enabled) begin
      if (cntxt.exp_q.size() != 0) begin
         `uvm_error("SB", $sformatf("Expected queue is not empty! exp_q.size() = %0d", cntxt.exp_q.size()))
         foreach(cntxt.exp_q[ii]) begin
            `uvm_info("SB", $sformatf("exp_q[%0d]: \n%s", ii, cntxt.exp_q[ii].sprint()), UVM_MEDIUM)
         end
      end
      
      if (cntxt.match_count == 0) begin
         `uvm_error("SB", "Scoreboard did not see any matches during simulation")
      end
   end
   
endfunction: check_phase


task uvml_sb_simplex_c::mode_in_order();
   
   T_ACT_TRN   act_trn;
   T_EXP_TRN   exp_trn;
   uvm_object  exp_obj;
   bit         found_match = 0;
   
   get_act       (act_trn);
   calc_act_stats(act_trn);
   log_new_act   (act_trn);
   
   if (cntxt.exp_q.size() == 0) begin
      log_act_before_exp(act_trn);
   end
   else begin
      exp_obj = cntxt.exp_q.pop_front();
      if (!$cast(exp_trn, exp_obj)) begin
         `uvm_fatal("SB", $sformatf("Could not cast 'exp_obj' (%s) to 'exp_trn' (%s)", $typename(exp_obj), $typename(exp_trn)))
      end
      if (exp_trn.compare(act_trn)) begin
         log_match(act_trn, exp_trn);
         cntxt.synced = 1;
         cntxt.match_count++;
      end
      else begin
         if (exp_trn.__may_drop) begin
            log_drop(act_trn, exp_trn);
         end
         else begin
            log_mismatch(act_trn, exp_trn);
         end
      end
   end
   
endtask : mode_in_order


task uvml_sb_simplex_c::mode_out_of_order();
   
   T_ACT_TRN     act_trn;
   T_EXP_TRN     exp_trn;
   uvm_object    act_obj, exp_obj;
   bit           found_match = 0;
   int unsigned  act_match_idx = 0;
   int unsigned  exp_match_idx = 0;
   
   get_act       (act_trn);
   calc_act_stats(act_trn);
   log_new_act   (act_trn);
   act_match_idx = cntxt.act_q.size()-1;
   
   if (cntxt.exp_q.size() == 0) begin
      log_act_before_exp(act_trn);
   end
   else begin
      foreach (cntxt.exp_q[ii]) begin
         exp_obj = cntxt.exp_q[ii];
         if (exp_obj.compare(act_trn)) begin
            exp_match_idx = ii;
            found_match = 1;
            cntxt.match_count++;
            if (!$cast(exp_trn, exp_obj)) begin
               `uvm_fatal("SB_SIMPLEX", $sformatf("Could not cast 'exp_obj' (%s) to 'exp_trn' (%s)", $typename(exp_obj), $typename(exp_trn)))
            end
            break;
         end
      end
      if (found_match) begin
         log_match(act_trn, exp_trn);
         cntxt.exp_q.delete(exp_match_idx);
         cntxt.act_q.delete(act_match_idx);
      end
      else begin
         if (exp_trn.__may_drop) begin
            log_drop(act_trn);
         end
         else begin
            log_mismatch(act_trn);
         end
      end
   end
   
endtask : mode_out_of_order


task uvml_sb_simplex_c::get_act(output T_ACT_TRN trn);
   
   act_fifo.get(trn);
   on_new_act  (trn);
   `uvml_hrtbt()
   cntxt.act_observed_e.trigger(trn);
   
endtask : get_act


task uvml_sb_simplex_c::get_exp(output T_EXP_TRN trn);
   
   exp_fifo.get(trn);
   on_new_exp  (trn);
   cntxt.exp_observed_e.trigger(trn);
   
endtask : get_exp


function void uvml_sb_simplex_c::calc_act_stats(ref T_ACT_TRN trn);
   
   bit [7:0]  packed_trn[];
   
   void'(trn.pack_bytes(packed_trn));
   cntxt.act_observed++;
   cntxt.act_bits_observed += packed_trn.size();
   
   if (trn.__has_error) begin
      cntxt.act_bad_observed++;
      cntxt.act_bad_bits_observed += packed_trn.size();
   end
   else begin
      cntxt.act_good_observed++;
      cntxt.act_good_bits_observed += packed_trn.size();
   end
   
   cntxt.act_q     .push_back(trn);
   cntxt.act_time_q.push_back($realtime());
   
endfunction : calc_act_stats


function void uvml_sb_simplex_c::calc_exp_stats(ref T_EXP_TRN trn);
   
   bit [7:0]  packed_trn[];
   
   void'(trn.pack_bytes(packed_trn));
   cntxt.exp_observed++;
   cntxt.exp_bits_observed += packed_trn.size();
   
   if (trn.__has_error) begin
      cntxt.exp_bad_observed++;
      cntxt.exp_bad_bits_observed += packed_trn.size();
   end
   else begin
      cntxt.exp_good_observed++;
      cntxt.exp_good_bits_observed += packed_trn.size();
   end
   
   cntxt.exp_q     .push_back(trn);
   cntxt.exp_time_q.push_back($realtime());
   
endfunction : calc_exp_stats


function void uvml_sb_simplex_c::log_new_act(ref T_ACT_TRN trn);
   
   `uvm_info("SB", $sformatf("New actual transaction from %s: \n%s", trn.__originator, trn.sprint()), UVM_HIGH)
   
endfunction : log_new_act


function void uvml_sb_simplex_c::log_new_exp(ref T_EXP_TRN trn);
   
   `uvm_info("SB", $sformatf("New expected transaction from %s: \n%s", trn.__originator, trn.sprint()), UVM_HIGH)
   
endfunction : log_new_exp


function void uvml_sb_simplex_c::log_act_before_exp(ref T_ACT_TRN trn);
   
   `uvm_error("SB", $sformatf("Actual received before expected:\n%s", trn.sprint()))
   
endfunction : log_act_before_exp


function void uvml_sb_simplex_c::log_match(ref T_ACT_TRN act_trn, T_EXP_TRN exp_trn);
   
   `uvm_info("SB", "Actual and Expected match!", UVM_HIGH)
   
endfunction : log_match


function void uvml_sb_simplex_c::log_mismatch(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   if (exp_trn != null) begin
      `uvm_error("SB", $sformatf("Actual and Expected do not match: \nActual:\n%s \n Expected:\n%s", act_trn.sprint(), exp_trn.sprint()))
   end
   else begin
      `uvm_error("SB", $sformatf("Did not find match for Actual:\n%s", act_trn.sprint()))
   end
   
endfunction : log_mismatch


function void uvml_sb_simplex_c::log_drop(ref T_ACT_TRN act_trn, input T_EXP_TRN exp_trn=null);
   
   if (exp_trn != null) begin
      `uvm_warning("SB", $sformatf("Actual and Expected do not match, may_drop=1: \nActual:\n%s \n Expected:\n%s", act_trn.sprint(), exp_trn.sprint()))
   end
   else begin
      `uvm_warning("SB", $sformatf("Did not find match for Actual, but may_drop=1:\n%s", act_trn.sprint()))
   end
   
endfunction : log_drop


task uvml_sb_simplex_c::on_new_act(ref T_ACT_TRN trn);
   
   // Default implementation is to do nothing
   
endtask : on_new_act


task uvml_sb_simplex_c::on_new_exp(ref T_EXP_TRN trn);
   
   // Default implementation is to do nothing
   
endtask : on_new_exp


`endif // __UVML_SB_SIMPLEX_SV__
