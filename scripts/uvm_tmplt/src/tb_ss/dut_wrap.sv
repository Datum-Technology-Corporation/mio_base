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


`ifndef __UVMT_${name_uppercase}_DUT_WRAP_SV__
`define __UVMT_${name_uppercase}_DUT_WRAP_SV__


/**
 * Module wrapper for ${name_normal_case} RTL DUT. All ports are SV interfaces.
 */
module uvmt_${name}_dut_wrap(
   uvma_${ral_agent_type}_if  ${ral_agent_type}_if
);
   
   // TODO Instantiate Device Under Test (DUT)
   //      Ex: ${name}_top  dut(
   //             .${ral_agent_type}_data(${ral_agent_type}_if.data),
   //             ...
   //          );
   
endmodule : uvmt_${name}_dut_wrap


`endif // __UVMT_${name_uppercase}_DUT_WRAP_SV__
