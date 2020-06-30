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


`ifndef __UVMA_CLK_MON_TRN_SV__
`define __UVMA_CLK_MON_TRN_SV__


/**
 * Object rebuilt from the Clock monitor Analog of uvma_clk_seq_item_c.
 */
class uvma_clk_mon_trn_c extends uvml_trn_mon_trn_c;
   
   // Data
   // TODO Add uvma_clk_mon_trn_c data fields
   //      Ex: logic        abc;
   //          logic [7:0]  xyz;
   
   
   `uvm_object_utils_begin(uvma_clk_mon_trn_c)
      // TODO Add UVM field utils for data fields
      //      Ex: `uvm_field_int(abc, UVM_DEFAULT)
      //          `uvm_field_int(xyz, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_clk_mon_trn");
   
endclass : uvma_clk_mon_trn_c


function uvma_clk_mon_trn_c::new(string name="uvma_clk_mon_trn");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_CLK_MON_TRN_SV__
