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


`ifndef __UVMT_${name_uppercase}_CLK_GEN_IF_SV__
`define __UVMT_${name_uppercase}_CLK_GEN_IF_SV__


/**
 * Interface providing clock signals to all other interfaces used by ${name_normal_case}
 * test bench (uvmt_${name}_tb). Managed by test cases.
 */
interface uvmt_${name}_clk_gen_if;
   
   import uvme_${name}_pkg::*;
   
   
   bit       start_clk = 0;
   logic     reset_clk        = 0;
   realtime  reset_clk_period = uvme_${name}_reset_default_clk_period * 1ps;
   logic     ${ral_agent_type}_clk        = 0;
   realtime  ${ral_agent_type}_clk_period = uvme_${name}_${ral_agent_type}_default_clk_period * 1ps;
   
   
   /**
    * Generates clock signals.
    */
   initial begin
      wait (start_clk);
      fork
         forever begin
            #(reset_clk_period/2) reset_clk = ~reset_clk;
         end
         forever begin
            #(${ral_agent_type}_clk_period/2) ${ral_agent_type}_clk = ~${ral_agent_type}_clk;
         end
      join_none
   end
   
   /**
    * Sets clock period in ps.
    */
   function void set_clk_periods(
      real reset_period,
      real ${ral_agent_type}_period
   );
      reset_clk_period = reset_period * 1ps;
      ${ral_agent_type}_clk_period = ${ral_agent_type}_period * 1ps;
   endfunction : set_clk_periods
   
   /**
    * Triggers the generation of clk.
    */
   function void start();
      start_clk = 1;
   endfunction : start
   
endinterface : uvmt_${name}_clk_gen_if


`endif // __UVMT_${name_uppercase}_CLK_GEN_IF_SV__
