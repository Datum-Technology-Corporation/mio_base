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


`ifndef __UVME_RESET_ST_CONSTANTS_SV__
`define __UVME_RESET_ST_CONSTANTS_SV__


const int unsigned  uvme_reset_st_rand_pulses_default_num_pulses          =    10;
const int unsigned  uvme_reset_st_rand_pulses_default_min_pulse_duration  =     1;
const int unsigned  uvme_reset_st_rand_pulses_default_max_pulse_duration  =   100;
const int unsigned  uvme_reset_st_rand_pulses_default_min_pulse_gap       =   100;
const int unsigned  uvme_reset_st_rand_pulses_default_max_pulse_gap       = 1_000;


`endif // __UVME_RESET_ST_CONSTANTS_SV__
