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


`ifndef __UVMA_RESET_SEQ_ITEM_SV__
`define __UVMA_RESET_SEQ_ITEM_SV__


/**
 * Object created by Reset agent sequences extending uvma_reset_seq_base_c.
 */
class uvma_reset_seq_item_c extends uvml_trn_seq_item_c;
   
   // Fields
   rand int unsigned  duration; // Clock cycles or picoseconds (ps), depending on agent configuration
   
   
   `uvm_object_utils_begin(uvma_reset_seq_item_c)
      `uvm_field_int(duration, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint default_cons {
      soft duration == uvma_reset_pulse_default_duration;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_seq_item");
   
endclass : uvma_reset_seq_item_c


function uvma_reset_seq_item_c::new(string name="uvma_reset_seq_item");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_RESET_SEQ_ITEM_SV__