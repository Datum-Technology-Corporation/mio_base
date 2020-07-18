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


`ifndef __UVMT_${name_uppercase}_ST_DUT_CHKR_SV__
`define __UVMT_${name_uppercase}_ST_DUT_CHKR_SV__


/**
 * Module encapsulating assertions for ${name_normal_case} VIP
 * Self-Testing DUT wrapper (uvmt_${name}_st_dut_wrap).
 */
module uvmt_${name}_st_dut_chkr(
   uvma_${name}_if  ${name_1}_if,
   uvma_${name}_if  ${name_2}_if
);
   
   `pragma protect begin
   
   // TODO Add assertions to uvmt_${name}_st_dut_chkr
   
   `pragma protect end
   
endmodule : uvmt_${name}_st_dut_chkr


`endif // __UVMT_${name_uppercase}_ST_DUT_CHKR_SV__
