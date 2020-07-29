// 
// Copyright 2020 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the “License”); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an “AS IS” BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 


`ifndef __UVML_RAL_REG_BLOCK_SV__
`define __UVML_RAL_REG_BLOCK_SV__


/**
 * TODO Describe uvml_ral_reg_block_c
 */
class uvml_ral_reg_block_c extends uvm_reg_block;
   
   longint unsigned  base_address;
   
   
   `uvm_object_utils_begin(uvml_ral_reg_block_c)
      `uvm_field_int(base_address, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_ral_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   /**
    * Returns the default base address for this register block. This value is
    * used if there is no entry found in the uvm_config_db.
    */
   extern virtual function longint unsigned get_default_base_address();
   
   /**
    * Creates register and register block instances and associates them with
    * this register block.
    */
   extern virtual function void build();
   
   /**
    * Creates register map and adds registers to it.
    */
   extern virtual function void connect();
   
   /**
    * Creates sub-block(s).
    */
   extern virtual function void create_blocks();
   
   /**
    * Creates register(s).
    */
   extern virtual function void create_regs();
   
   /**
    * TODO Describe uvme_pkt_snf_ral_c::create_reg_map()
    */
   extern virtual function void create_reg_map();
   
   /**
    * Adds register(s) to register map.
    */
   extern virtual function void add_regs_to_map();
   
endclass : uvml_ral_reg_block_c


function uvml_ral_reg_block_c::new(string name="uvml_ral_reg_block", int has_coverage=UVM_NO_COVERAGE);
   
   super.new(name, has_coverage);
   if (!uvm_config_db#(longint unsigned)::get(this, "", "base_address", base_address)) begin
      `uvm_warning("REG_BLOCK", "Did not find 'base_address' for this block in uvm_config_db. Using default.")
      base_address = get_default_base_address();
   end
   
endfunction : new


function longint unsigned uvml_ral_reg_block_c::get_default_base_address();
   
   return 0;
   
endfunction : get_default_base_address


function void uvml_ral_reg_block_c::build();
   
   create_blocks  ();
   create_regs    ();
   create_reg_map ();
   add_regs_to_map();
   lock_model     ();
   
endfunction: build


function void uvml_ral_reg_block_c::connect();
   
   super.connect();
   
   create_reg_map ();
   add_regs_to_map();
   
endfunction: build


function void uvml_ral_reg_block_c::create_blocks();
   
   // Empty
   
endfunction : create_blocks


function void uvml_ral_reg_block_c::create_regs();
   
   // Empty
   
endfunction : create_regs


function void uvml_ral_reg_block_c::create_reg_map();
   
   // Empty
   
endfunction : create_reg_map


function void uvml_ral_reg_block_c::add_regs_to_map();
   
   // Empty
   
endfunction : add_regs_to_map


`endif // __UVML_RAL_REG_BLOCK_SV__
