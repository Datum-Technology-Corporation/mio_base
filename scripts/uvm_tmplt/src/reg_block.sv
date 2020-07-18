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


`ifndef __UVME_${name_uppercase}_RAL_SV__
`define __UVME_${name_uppercase}_RAL_SV__


/**
 * TODO Describe uvme_${name}_ral_c
 */
class uvme_${name}_ral_c extends uvml_ral_reg_block;
   
   // Sub-Blocks
   // TODO Add sub-block(s)
   //      Ex: rand uvme_${name}_abc_reg_block_c  abc;
   
   // Registers
   // TODO Add register(s)
   //      Ex: rand uvme_${name}_xyz_reg_c  xyz;
   
   
   `uvm_object_utils_begin(uvme_${name}_ral_c)
      // TODO Add field macros for sub-block(s) and register(s)
      //      Ex: `uvm_field_object(abc, UVM_DEFAULT)
      //          `uvm_field_object(xyz, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvme_${name}_ral");
   
   /**
    * Creates register and register block instances and associates them with this
    * register block.
    */
   extern virtual function void build();
   
   /**
    * Creates sub-block(s).
    */
   extern function void create_blocks();
   
   /**
    * Creates register(s).
    */
   extern function void create_regs();
   
   /**
    * Adds register(s) to register map.
    */
   extern function void add_regs_to_map();
   
endclass : uvme_${name}_ral_c


`pragma protect begin


function uvme_${name}_ral_c::new(string name="uvme_${name}_ral");
   
   super.new(name, UVM_NO_COVERAGE);
   
endfunction : new


function void uvme_${name}_ral_c::build();
   
   super.build();
   
   create_blocks();
   create_regs  ();
   
endfunction: build


function void uvme_${name}_ral_c::connect();
   
   super.connect();
   
   create_reg_map ();
   add_regs_to_map();
   
endfunction: build


function void uvme_${name}_ral_c::create_blocks();
   
   // TODO Implement uvme_${name}_ral_c::create_blocks()
   //      Ex: abc = uvme_${name}_abc_reg_block_c::type_id::create("abc");
   //          abc.configure(this);
   //          abc.build();
   
endfunction : create_blocks


function void uvme_${name}_ral_c::create_regs();
   
   // TODO Implement uvme_${name}_ral_c::create_regs()
   //      Ex:  xyz = uvme_${name}_xyz_reg_c::type_id::create("xyz");
   //           xyz.configure(this);
   //           xyz.build();
   
endfunction : create_regs


function void uvme_${name}_ral_c::create_reg_map();
   
   default_map = create_map(
      .name     ("default_map"),
      .base_addr(base_address),
      .n_bytes  (4),
      .endian   (UVM_LITTLE_ENDIAN)
   );
   
endfunction : create_reg_map


function void uvme_${name}_ral_c::add_regs_to_map();
   
   // TODO Implement uvme_${name}_ral_c::add_regs_to_map()
   //      Ex: default_map.add_reg(
   //             .rg    (xyz),
   //             .offset(32'h00_00_00_00),
   //             .rights("RW")
   //          );
   
endfunction : add_regs_to_map


`pragma protect end


`endif // _UVME_${name_uppercase}_RAL_SV__
