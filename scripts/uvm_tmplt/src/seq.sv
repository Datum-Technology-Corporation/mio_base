// 
// ${copyright_header}
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


`ifndef __UVMA_${agent_name_uppercase}_${name_uppercase}_SEQ_SV__
`define __UVMA_${agent_name_uppercase}_${name_uppercase}_SEQ_SV__


/**
 * TODO Describe uvma_${agent_name}_${name}_seq_c
 */
class uvma_${agent_name}_${name}_seq_c extends uvma_${agent_name}_base_seq_c;
   
   // Fields
   
   
   `uvm_object_utils_begin(uvma_${agent_name}_${name}_seq_c)
      
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_${agent_name}_${name}_seq");
   
   /**
    * TODO Describe uvma_${agent_name}_${name}_seq_c::body()
    */
   extern virtual task body();
   
endclass : uvma_${agent_name}_${name}_seq_c


`pragma protect begin


function uvma_${agent_name}_${name}_seq_c::new(string name="uvma_${agent_name}_${name}_seq");
   
   super.new(name);
   
endfunction : new


task uvma_${agent_name}_${name}_seq_c::body();
   
   // TODO Implement uvma_${agent_name}_${name}_seq_c::body()
   
endtask : body


`pragma protect end


`endif // __UVMA_${agent_name_uppercase}_${name_uppercase}_SEQ_SV__
