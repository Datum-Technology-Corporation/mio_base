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


`ifndef __UVMA_RESET_PULSE_SEQ_SV__
`define __UVMA_RESET_PULSE_SEQ_SV__


/**
 * Asserts and de-asserts reset.
 */
class uvma_reset_pulse_seq_c extends uvma_reset_base_seq_c;
   
   rand int unsigned  duration;
   
   
   `uvm_object_utils_begin(uvma_reset_pulse_seq_c)
      `uvm_field_int(duration, UVM_DEFAULT + UVM_DEC)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft duration == uvma_reset_pulse_default_duration;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_pulse_seq");
   
   /**
    * TODO Describe uvma_reset_pulse_seq_c::body()
    */
   extern virtual task body();
   
endclass : uvma_reset_pulse_seq_c


function uvma_reset_pulse_seq_c::new(string name="uvma_reset_pulse_seq");
   
   super.new(name);
   
endfunction : new


task uvma_reset_pulse_seq_c::body();
   
   `uvm_do_with(req, {
      req.duration == local::duration;
   })
   
endtask : body


`endif // __UVMA_RESET_PULSE_SEQ_SV__
