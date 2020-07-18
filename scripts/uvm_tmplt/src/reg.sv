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


`ifndef __UVME_${name_uppercase}_REG_SV__
`define __UVME_${name_uppercase}_REG_SV__


/**
 * TODO Describe uvme_${name}_reg_c
 */
class uvme_${name}_reg_c extends uvm_reg;
   
   // TODO Add register fields
   //      Ex: rand uvm_reg_field  xyz;
   
   
   `uvm_object_utils_begin(uvme_${name}_reg_c)
      // TODO Add field macros for register fields
      //      Ex: `uvm_field_object(xyz, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_${name}_reg");
   
   /**
    * Create and configure register fields.
    */
   extern function void build();
   
endclass : uvme_${name}_reg_c


function uvme_${name}_reg_c::new(string name="uvme_${name}_reg");
   
   super.new(
      .name        (name),
      .n_bits      (32),
      .has_coverage(UVM_NO_COVERAGE)
   );
   
endfunction : new


function void uvme_${name}_reg_c::build();
   
   // TODO Create and configure register fields
   //      Ex: xyz = uvm_reg_field::type_id::create("xyz");
   //          xyz.configure(
   //             .parent                 (this),
   //             .size                   (   1),
   //             .lsb_pos                (   0),
   //             .access                 ("RW"),
   //             .volatile               (   0),
   //             .reset                  (   1),
   //             .has_reset              (   1),
   //             .is_rand                (   1),
   //             .individually_accessible(   0)
   //          );
   
endfunction: build


`endif // __UVME_${name_uppercase}_REG_SV__
