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


`ifndef __UVME_${name_uppercase}_CFG_SV__
`define __UVME_${name_uppercase}_CFG_SV__


/**
 * Object encapsulating all parameters for creating, connecting and running
 * ${name_normal_case} environment (uvme_${name}_env_c) components.
 */
class uvme_${name}_cfg_c extends uvm_object;
   
   // Generic options
   rand bit                      enabled;
   rand uvm_active_passive_enum  is_active;
   rand bit                      scoreboarding_enabled;
   rand bit                      cov_model_enabled;
   rand bit                      trn_log_enabled;
   
   // Sub-system parameters
   rand longint unsigned  ral_base_address;
   rand int unsigned      reset_clk_period;
   rand int unsigned      ${ral_agent_type}_clk_period;
   
   // TODO: Add sub-environments configuration handles
   //       Ex: rand uvme_sub_env_cfg_c  sub_env_cfg;
   
   // Agent cfg handles
   rand uvma_${ral_agent_type}_cfg_c  ${ral_agent_type}_cfg;
   rand uvma_${reset_agent_type}_cfg_c  reset_cfg;
   
   // Objects
   rand uvme_${name}_ral_c  ${name}_ral;
   // TODO Add scoreboard configuration handles
   //      Ex: rand uvml_sb_cfg_c  sb_egress_cfg;
   //          rand uvml_sb_cfg_c  sb_ingress_cfg;
   
   
   `uvm_object_utils_begin(uvme_${name}_cfg_c)
      `uvm_field_int (                         enabled              , UVM_DEFAULT)
      `uvm_field_enum(uvm_active_passive_enum, is_active            , UVM_DEFAULT)
      `uvm_field_int (                         scoreboarding_enabled, UVM_DEFAULT)
      `uvm_field_int (                         cov_model_enabled    , UVM_DEFAULT)
      `uvm_field_int (                         trn_log_enabled      , UVM_DEFAULT)
      
      `uvm_field_int(ral_base_address            , UVM_DEFAULT          )
      `uvm_field_int(reset_clk_period            , UVM_DEFAULT + UVM_DEC)
      `uvm_field_int(${ral_agent_type}_clk_period, UVM_DEFAULT + UVM_DEC)
      
      // TODO: Add sub-environments configuration field macros
      //       Ex: `uvm_field_object(sub_env_cfg, UVM_DEFAULT)
      
      `uvm_field_object(${ral_agent_type}_cfg, UVM_DEFAULT)
      `uvm_field_object(reset_cfg, UVM_DEFAULT)
      
      `uvm_field_object(${name}_ral, UVM_DEFAULT)
      // TODO Add scoreboard cfg field macros
      //      Ex: `uvm_field_object(sb_egress_cfg , UVM_DEFAULT)
      //          `uvm_field_object(sb_ingress_cfg, UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   constraint defaults_cons {
      soft enabled                      == 0;
      soft is_active                    == UVM_PASSIVE;
      soft scoreboarding_enabled        == 1;
      soft cov_model_enabled            == 0;
      soft trn_log_enabled              == 1;
      soft ral_base_address             == uvme_${name}_rall_default_base_address;
      soft reset_clk_period             == uvme_${name}_reset_default_clk_period;
      soft ${ral_agent_type}_clk_period == uvme_${name}_${ral_agent_type}_default_clk_period;
   }
   
   constraint agent_cfg_cons {
      if (enabled) {
         ${ral_agent_type}_cfg.enabled == 1;
         reset_cfg.enabled == 1;
      }
      
      if (is_active == UVM_ACTIVE) {
         ${ral_agent_type}_cfg.is_active == UVM_ACTIVE;
         reset_cfg.is_active == UVM_ACTIVE;
      }
      
      if (trn_log_enabled) {
         ${ral_agent_type}_cfg.trn_log_enabled == 1;
         reset_cfg.trn_log_enabled == 1;
      }
   }
   
   
   /**
    * Creates sub-configuration objects.
    */
   extern function new(string name="uvme_${name}_cfg");
   
endclass : uvme_${name}_cfg_c


`pragma protect begin


function uvme_${name}_cfg_c::new(string name="uvme_${name}_cfg");
   
   super.new(name);
   
   // TODO Create environment cfg objects
   //      Ex: sub_env_cfg  = uvme_sub_env_cfg_c::type_id::create("sub_env_cfg");
   
   ${ral_agent_type}_cfg = uvma_${ral_agent_type}_cfg_c::type_id::create("${ral_agent_type}_cfg");
   reset_cfg = uvma_${reset_agent_type}_cfg_c::type_id::create("reset_cfg");
   
   ${name}_ral = uvme_${name}_ral_c::type_id::create("${name}_ral");
   ${name}_ral.build();
   ${name}_ral.lock_model();
   
   // TODO Create scoreboard cfg objects
   //      Ex: sb_egress_cfg  = uvml_sb_cfg_c::type_id::create("sb_egress_cfg" );
   //          sb_ingress_cfg = uvml_sb_cfg_c::type_id::create("sb_ingress_cfg");
   
endfunction : new


`pragma protect end


`endif // __UVME_${name_uppercase}_CFG_SV__
