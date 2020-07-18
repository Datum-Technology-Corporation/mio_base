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


`ifndef __UVMT_CLK_ST_DUT_CHKR_SV__
`define __UVMT_CLK_ST_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for Clock VIP
 * Self-Testing DUT wrapper (uvmt_clk_st_dut_wrap).
 */
module uvmt_clk_st_dut_chkr(
   uvma_clk_if  active_if,
   uvma_clk_if  passive_if
);
   
   `pragma protect begin
   
   // TODO Add assertions to uvmt_clk_st_dut_chkr
   
   `pragma protect end
   
endmodule : uvmt_clk_st_dut_chkr


`endif // __UVMT_CLK_ST_DUT_CHKR_SV__