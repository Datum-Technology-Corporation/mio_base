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


`ifndef __UVMT_${name_uppercase}_ST_CONSTANTS_SV__
`define __UVMT_${name_uppercase}_ST_CONSTANTS_SV__


const int unsigned uvmt_${name}_st_default_clk_period          =     10_000; //  10 ns (100 Mhz)
const int unsigned uvmt_${name}_st_default_reset_period        =         10; //  10 ns
const int unsigned uvmt_${name}_st_default_startup_timeout     =    200_000; //  2 us // TODO Set default Heartbeat Monitor startup timeout
const int unsigned uvmt_${name}_st_default_heartbeat_period    =    200_000; //  2 us // TODO Set default Heartbeat Monitor period
const int unsigned uvmt_${name}_st_default_simulation_timeout  = 10_000_000; // 10 ms // TODO Set default simulation timeout


`endif // __UVMT_${name_uppercase}_ST_CONSTANTS_SV__
