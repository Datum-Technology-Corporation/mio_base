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


`ifndef __UVML_RAL_REG_ADAPTER_SV__
`define __UVML_RAL_REG_ADAPTER_SV__


/**
 * Object that converts between abstract register operations (UVM) and
 * RAL operations.
 */
class uvml_ral_reg_adapter_c extends uvm_reg_adapter;
   
   `uvm_object_utils(uvml_ral_reg_adapter_c)
   
   
   /**
    * Default constructor
    */
   extern function new(string name="uvml_ral_reg_adapter");
   
   /**
    * Converts from UVM register operation to Advanced Peripheral Bus.
    */
   extern virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
   
   /**
    * Converts from Advanced Peripheral Bus to UVM register operation.
    */
   extern virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
   
endclass : uvml_ral_reg_adapter_c


function uvml_ral_reg_adapter_c::new(string name="uvml_ral_reg_adapter");
   
   super.new(name);
   
endfunction : new


function uvm_sequence_item uvml_ral_reg_adapter_c::reg2bus(const ref uvm_reg_bus_op rw);
   
   // Empty
   
endfunction : reg2bus


function void uvml_ral_reg_adapter_c::bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
   
   // Empty
   
endfunction : bus2reg


`endif // __UVML_RAL_REG_ADAPTER_SV__
