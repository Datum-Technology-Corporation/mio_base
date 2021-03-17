// 
// Copyright 2021 Datum Technology Corporation
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// 
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may
// not use this file except in compliance with the License, or, at your option,
// the Apache License version 2.0. You may obtain a copy of the License at
// 
//     https://solderpad.org/licenses/SHL-2.1/
// 
// Unless required by applicable law or agreed to in writing, any work
// distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
// WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
// License for the specific language governing permissions and limitations
// under the License.
// 


`ifndef __UVMA_CLK_IF_SV__
`define __UVMA_CLK_IF_SV__


/**
 * Encapsulates all signals and clocking of Clock interface. Used by
 * monitor (uvma_clk_mon_c) and driver (uvma_clk_drv_c).
 */
interface uvma_clk_if;
   
   // Signals
   logic/*wire*/  clk;
   
   
   /// @name Singleton Implementation (i.e. without agent)
   /// @{
   
   // State variables
   bit       clk_started = 0;
   realtime  clk_period  = 10ns;
   
   
   /**
    * Generates clk signal.
    */
   initial begin
      wait (clk_started);
      fork
         forever begin
            #(clk_period/2) clk = ~clk;
         end
      join_none
   end
   
   /**
    * Sets clock period in ps.
    */
   function void set_clk_period(realtime period);
      clk_period = period * 1ps;
   endfunction : set_clk_period
   
   /**
    * Triggers the generation of clk.
    */
   function void start_clk();
      clk_started = 1;
   endfunction : start_clk
   
   /// @}
   
endinterface : uvma_clk_if


`endif // __UVMA_CLK_IF_SV__
