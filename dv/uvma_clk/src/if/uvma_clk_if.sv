// 
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


`ifndef __UVMA_CLK_IF_SV__
`define __UVMA_CLK_IF_SV__


/**
 * Encapsulates all signals and clocking of Clock interface. Used by
 * monitor (uvma_clk_mon_c) and driver (uvma_clk_drv_c).
 */
interface uvma_clk_if;
   
   // Signals
   wire  clk;
   
endinterface : uvma_clk_if


`endif // __UVMA_CLK_IF_SV__
