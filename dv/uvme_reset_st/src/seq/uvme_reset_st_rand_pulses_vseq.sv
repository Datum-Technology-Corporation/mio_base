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


`ifndef __UVME_RESET_ST_RAND_PULSES_SEQ_SV__
`define __UVME_RESET_ST_RAND_PULSES_SEQ_SV__


/**
 * TODO Describe uvme_reset_st_rand_pulses_vseq_c
 */
class uvme_reset_st_rand_pulses_vseq_c extends uvme_reset_st_base_vseq_c;
   
   // Fields
   rand int unsigned  num_pulses        ;
   rand int unsigned  min_pulse_duration;
   rand int unsigned  max_pulse_duration;
   rand int unsigned  min_pulse_gap     ;
   rand int unsigned  max_pulse_gap     ;
   
   
   `uvm_object_utils_begin(uvme_reset_st_rand_pulses_vseq_c)
      `uvm_field_int(num_pulses        , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_pulse_duration, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_pulse_duration, UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(min_pulse_gap     , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(max_pulse_gap     , UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      num_pulses         == uvme_reset_st_rand_pulses_default_num_pulses        ;
      min_pulse_duration == uvme_reset_st_rand_pulses_default_min_pulse_duration;
      max_pulse_duration == uvme_reset_st_rand_pulses_default_max_pulse_duration;
      min_pulse_gap      == uvme_reset_st_rand_pulses_default_min_pulse_gap     ;
      max_pulse_gap      == uvme_reset_st_rand_pulses_default_max_pulse_gap     ;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_reset_st_rand_pulses_vseq");
   
   /**
    * TODO Describe uvme_reset_st_rand_pulses_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvme_reset_st_rand_pulses_vseq_c


function uvme_reset_st_rand_pulses_vseq_c::new(string name="uvme_reset_st_rand_pulses_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_reset_st_rand_pulses_vseq_c::body();
   
   uvma_reset_pulse_seq_c  pulse_seq  ;
   int unsigned            current_gap;
   
   
   for (int unsigned ii=0; ii<num_pulses; ii++) begin
      `uvm_info("RESET_VSEQ", $sformatf("Starting reset pulse #%0d of %0d", (ii+1), num_pulses), UVM_LOW)
      `uvm_do_on_with(pulse_seq, p_sequencer.active_sequencer, {
         pulse_seq.duration inside {[min_pulse_duration:max_pulse_duration]};
      })
      
      current_gap = $urandom_range(min_pulse_gap, max_pulse_gap);
      case (cfg.reset_type)
         UVMA_RESET_TYPE_SYNCHRONOUS: begin
            `uvm_info("RESET_VSEQ", $sformatf("Waiting %0d cycles before next reset pulse", current_gap), UVM_LOW)
            repeat (current_gap) begin
               @(cntxt.active_cntxt.vif.drv_cb);
            end
         end
         
         UVMA_RESET_TYPE_SYNCHRONOUS: begin
            `uvm_info("RESET_VSEQ", $sformatf("Waiting %0t before next reset pulse", (current_gap * 1ps)), UVM_LOW)
            #(current_gap * 1ps);
         end
         
         default: `uvm_fatal("RESET_VSEQ", $sformatf("Invalid cfg.reset_type: %s", cfg.reset_type.name()))
      endcase
   end
   
endtask : body


`endif // __UVME_RESET_ST_RAND_PULSES_SEQ_SV__
