// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_RESET_CFG_SV__
`define __UVMA_RESET_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running all
 * Reset agent (uvma_reset_agent_c) components.
 */
class uvma_reset_cfg_c extends uvm_object;
   
   // Generic options
   rand bit                      enabled;
   rand uvm_active_passive_enum  is_active;
   rand uvm_sequencer_arb_mode   sqr_arb_mode;
   rand bit                      cov_model_enabled;
   rand bit                      trn_log_enabled;
   
   // Protocol parameters
   rand uvma_reset_type_enum            reset_type    ;
   rand uvma_reset_polarity_enum        polarity      ;
   rand uvma_reset_drv_init_state_enum  drv_init_state;
   
   
   `uvm_object_utils_begin(uvma_reset_cfg_c)
      `uvm_field_int (                         enabled          , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active        , UVM_DEFAULT)
      `uvm_field_enum(uvm_sequencer_arb_mode , sqr_arb_mode     , UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled, UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled  , UVM_DEFAULT)
      
      `uvm_field_enum(uvma_reset_type_enum          , reset_type    , UVM_DEFAULT)
      `uvm_field_enum(uvma_reset_polarity_enum      , polarity      , UVM_DEFAULT)
      `uvm_field_enum(uvma_reset_drv_init_state_enum, drv_init_state, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled           == 1;
      soft is_active         == UVM_PASSIVE;
      soft sqr_arb_mode      == UVM_SEQ_ARB_FIFO;
      soft cov_model_enabled == 0;
      soft trn_log_enabled   == 1;
      
      soft reset_type     == UVMA_RESET_TYPE_SYNCHRONOUS         ;
      soft polarity       == UVMA_RESET_POLARITY_ACTIVE_LOW      ;
      soft drv_init_state == UVMA_RESET_DRV_INIT_STATE_DEASSERTED;
   }
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_reset_cfg");
   
endclass : uvma_reset_cfg_c


function uvma_reset_cfg_c::new(string name="uvma_reset_cfg");
   
   super.new(name);
   
endfunction : new


`endif // __UVMA_RESET_CFG_SV__
