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


`ifndef __UVMA_CLK_BASE_SEQ_SV__
`define __UVMA_CLK_BASE_SEQ_SV__


/**
 * Abstract object from which all other Clock agent sequences must extend.
 * Subclasses must be run on Clock sequencer (uvma_clk_sqr_c) instance.
 */
class uvma_clk_base_seq_c extends uvm_sequence#(
   .REQ(uvma_clk_seq_item_c),
   .RSP(uvma_clk_seq_item_c)
);
   
   // Agent handles
   uvma_clk_cfg_c    cfg;
   uvma_clk_cntxt_c  cntxt;
   
   
   `uvm_object_utils(uvma_clk_base_seq_c)
   `uvm_declare_p_sequencer(uvma_clk_sqr_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_clk_base_seq");
   
   /**
    * Assigns cfg and cntxt handles from p_sequencer.
    */
   extern virtual task pre_start();
   
endclass : uvma_clk_base_seq_c


function uvma_clk_base_seq_c::new(string name="uvma_clk_base_seq");
   
   super.new(name);
   
endfunction : new


task uvma_clk_base_seq_c::pre_start();
   
   cfg   = p_sequencer.cfg;
   cntxt = p_sequencer.cntxt;
   
endtask : pre_start


`endif // __UVMA_CLK_BASE_SEQ_SV__