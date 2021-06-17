// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMT_RESET_ST_TB_SV__
`define __UVMT_RESET_ST_TB_SV__


/**
 * Module encapsulating the Reset VIP Self-Test DUT wrapper,
 * agents and clock generating interfaces. The clock and reset interface only
 * feeds into the Reset VIP interfaces.
 */
module uvmt_reset_st_tb;
   
   import uvm_pkg          ::*;
   import uvmt_reset_st_pkg::*;
   
   // Clocking & Reset
   uvmt_reset_st_clk_gen_if  clk_gen_if();
   
   // Agent interfaces
   uvma_reset_if  active_if (.clk(clk_gen_if.clk));
   uvma_reset_if  passive_if(.clk(clk_gen_if.clk));
   
   // DUT instance
   uvmt_reset_st_dut_wrap  dut_wrap(.*);
   
   
   /**
    * Test bench entry point.
    */
   initial begin
      // Specify time format for simulation (units_number, precision_number, suffix_string, minimum_field_width)
      $timeformat(-9, 3, " ns", 18);
      
      // Add interfaces to uvm_config_db
      uvm_config_db#(virtual uvmt_reset_st_clk_gen_if)::set(null, "*"                  , "clk_gen_vif", clk_gen_if);
      uvm_config_db#(virtual uvma_reset_if           )::set(null, "*.env.active_agent" , "vif"        , active_if );
      uvm_config_db#(virtual uvma_reset_if           )::set(null, "*.env.passive_agent", "vif"        , passive_if);
      
      // Run test
      uvm_top.enable_print_topology = 1;
      uvm_top.finish_on_completion  = 1;
      uvm_top.run_test();
   end
   
endmodule : uvmt_reset_st_tb


`endif // __UVMT_RESET_ST_TB_SV__
