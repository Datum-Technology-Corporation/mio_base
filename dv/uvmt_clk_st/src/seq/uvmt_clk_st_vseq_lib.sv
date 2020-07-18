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


`ifndef __UVMT_CLK_ST_VSEQ_LIB_SV__
`define __UVMT_CLK_ST_VSEQ_LIB_SV__


/**
 * Object holding virtual sequence library for Clock test cases.
 */
class uvmt_clk_st_vseq_lib_c extends uvm_sequence_library#(
   .REQ(uvm_sequence_item),
   .RSP(uvm_sequence_item)
);
   
   `uvm_object_utils          (uvmt_clk_st_vseq_lib_c)
   `uvm_sequence_library_utils(uvmt_clk_st_vseq_lib_c)
   
   
   /**
    * Initializes sequence library.
    */
   extern function new(string name="uvmt_clk_st_vseq_lib");
   
endclass : uvmt_clk_st_vseq_lib_c


function uvmt_clk_st_vseq_lib_c::new(string name="uvmt_clk_st_vseq_lib");
   
   super.new(name);
   init_sequence_library();
   
   // TODO Add sequences to uvmt_clk_st_vseq_lib_c
   //      Ex: add_sequence(uvmt_clk_st_abc_vseq_c::get_type());
   
endfunction : new


`endif // __UVMT_CLK_ST_VSEQ_LIB_SV__
