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


`ifndef __UVMA_RESET_TDEFS_SV__
`define __UVMA_RESET_TDEFS_SV__


typedef enum bit {
   UVMA_RESET_TYPE_SYNCHRONOUS   = 1,
   UVMA_RESET_TYPE_ASYNCHRONOUS  = 0
} uvma_reset_type_enum;

typedef enum {
   UVMA_RESET_POLARITY_ACTIVE_LOW ,
   UVMA_RESET_POLARITY_ACTIVE_HIGH
} uvma_reset_polarity_enum;

typedef enum {
   UVMA_RESET_DRV_INIT_STATE_DEASSERTED,
   UVMA_RESET_DRV_INIT_STATE_ASSERTED  ,
   UVMA_RESET_DRV_INIT_STATE_X         ,
   UVMA_RESET_DRV_INIT_STATE_Z
} uvma_reset_drv_init_state_enum;

typedef enum {
   UVMA_RESET_STATE_PRE_RESET ,
   UVMA_RESET_STATE_IN_RESET  ,
   UVMA_RESET_STATE_POST_RESET
} uvma_reset_state_enum;


`endif // __UVMA_RESET_TDEFS_SV__
