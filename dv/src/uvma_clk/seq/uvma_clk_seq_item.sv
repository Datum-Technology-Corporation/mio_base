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


`ifndef __UVMA_CLK_SEQ_ITEM_SV__
`define __UVMA_CLK_SEQ_ITEM_SV__


/**
 * Object created by Clock agent sequences extending uvma_clk_seq_base_c.
 */
class uvma_clk_seq_item_c extends uvml_trn_seq_item_c;
   
   // TODO Add uvma_clk_seq_item_c fields
   //      Ex: rand bit [7:0]  abc;
   
   
   `uvm_object_utils_begin(uvma_clk_seq_item_c)
      // TODO Add uvma_clk_seq_item_c UVM field utils
      //      Ex: `uvm_field_int(abc, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   // TODO Add uvma_clk_seq_item_c constraints
   //      Ex: constraint default_cons {
   //             abc inside {0,2,4,8,16,32};
   //          }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_clk_seq_item");
   
endclass : uvma_clk_seq_item_c


function uvma_clk_seq_item_c::new(string name="uvma_clk_seq_item");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_CLK_SEQ_ITEM_SV__
