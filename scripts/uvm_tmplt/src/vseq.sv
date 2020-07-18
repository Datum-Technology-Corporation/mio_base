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


`ifndef __UVME_${env_name_uppercase}_${name_uppercase}_VSEQ_SV__
`define __UVME_${env_name_uppercase}_${name_uppercase}_VSEQ_SV__


/**
 * TODO Describe uvme_${env_name}_${name}_vseq_c
 */
class uvme_${env_name}_${name}_vseq_c extends uvme_${env_name}_base_vseq_c;
   
   
   
   
   `uvm_object_utils_begin(uvme_${env_name}_${name}_vseq_c)
      
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_${env_name}_${name}_vseq");
   
   /**
    * TODO Describe uvme_${env_name}_${name}_vseq_c::body()
    */
   extern virtual task body();
   
endclass : uvme_${env_name}_${name}_vseq_c


`pragma protect begin


function uvme_${env_name}_${name}_vseq_c::new(string name="uvme_${env_name}_${name}_vseq");
   
   super.new(name);
   
endfunction : new


task uvme_${env_name}_${name}_vseq_c::body();
   
   // TODO Implement uvme_${env_name}_${name}_vseq_c::body()
   
endtask : body


`pragma protect end


`endif // __UVME_${env_name_uppercase}_${name_uppercase}_VSEQ_SV__
