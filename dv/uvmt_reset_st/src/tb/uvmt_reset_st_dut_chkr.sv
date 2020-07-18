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


`ifndef __UVMT_RESET_ST_DUT_CHKR_SV__
`define __UVMT_RESET_ST_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for Reset VIP
 * Self-Testing DUT wrapper (uvmt_reset_st_dut_wrap).
 */
module uvmt_reset_st_dut_chkr(
   uvma_reset_if  active_if,
   uvma_reset_if  passive_if
);
   
   `pragma protect begin
   
   // TODO Add assertions to uvmt_reset_st_dut_chkr
   
   `pragma protect end
   
endmodule : uvmt_reset_st_dut_chkr


`endif // __UVMT_RESET_ST_DUT_CHKR_SV__
