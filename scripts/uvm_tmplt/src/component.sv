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


`ifndef __${name_uppercase}_SV__
`define __${name_uppercase}_SV__


/**
 * TODO Describe ${name}_c
 */
class ${name}_c extends ${base_class};
   
   // Fields
   
   
   
   `uvm_component_utils_begin(${name}_c)
      // UVM Field Util Macros
   `uvm_component_utils_end
   
   
   // Constraints
   
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="${name}", uvm_component parent=null);
   
   // Methods
   
   
endclass : ${name}_c


`pragma protect begin


function ${name}_c::new(string name="${name}", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


`pragma protect end


`endif // __${name_uppercase}_SV__
