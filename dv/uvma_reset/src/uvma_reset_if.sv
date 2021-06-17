// Copyright 2021 Datum Technology Corporation
// 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License"); you may not use this file except in compliance
// with the License, or, at your option, the Apache License version 2.0.  You may obtain a copy of the License at
//                                        https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on
// an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.


`ifndef __UVMA_RESET_IF_SV__
`define __UVMA_RESET_IF_SV__


/**
 * Encapsulates all signals and clocking of Reset interface. Used by
 * monitor and driver.
 */
interface uvma_reset_if (
   input logic clk
);
   
   // Signals
   logic/*wire*/  reset  ;
   logic/*wire*/  reset_n;
   
   
   /**
    * Used by uvma_reset_drv_c.
    */
   clocking drv_cb @(posedge clk);
      output  reset  ,
              reset_n;
   endclocking : drv_cb
   
   /**
    * Used by uvma_reset_mon_c.
    */
   clocking mon_cb @(posedge clk);
      input  reset  ,
             reset_n;
   endclocking : mon_cb
   
   modport active_mp (clocking drv_cb);
   modport passive_mp(clocking mon_cb);
   
endinterface : uvma_reset_if


`endif // __UVMA_RESET_IF_SV__
