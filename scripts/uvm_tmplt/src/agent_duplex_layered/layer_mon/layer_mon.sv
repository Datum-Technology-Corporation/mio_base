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


`ifndef __UVMA_${name_uppercase}_LAYER_MON_${layer_name_uppercase}_SV__
`define __UVMA_${name_uppercase}_LAYER_MON_${layer_name_uppercase}_SV__


/**
 * TODO Describe uvma_${name}_layer_mon_${layer_name}_c
 */
class uvma_${name}_layer_mon_${layer_name}_c extends uvma_${name}_layer_mon_base_c#(
   .T_TRN_IN (uvma_${name}_layer_mon_trn_fs_pyld_c),
   .T_TRN_OUT(uvma_${name}_mon_trn_c              )
);
   
   `uvm_component_utils(uvma_${name}_layer_mon_sas_c)
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvma_${name}_layer_mon_${layer_name}", uvm_component parent=null);
   
   /**
    * TODO Describe uvma_${name}_layer_mon_${layer_name}_c::process_${direction_rx}_traffic
    */
   extern virtual task process_${direction_rx}_traffic();
   
   /**
    * TODO Describe uvma_${name}_layer_mon_${layer_name}_c::process_${direction_tx}_traffic
    */
   extern virtual task process_${direction_tx}_traffic();
   
endclass : uvma_${name}_layer_mon_${layer_name}_c


`pragma protect begin


function uvma_${name}_layer_mon_${layer_name}_c::new(string name="uvma_${name}_layer_mon_${layer_name}", uvm_component parent=null);
   
   super.new(name, parent);
   
endfunction : new


task uvma_${name}_layer_mon_${layer_name}_c::process_${direction_rx}_traffic();
   
   
   
endtask : process_${direction_rx}_traffic


task uvma_${name}_layer_mon_${layer_name}_c::process_${direction_tx}_traffic();
   
   
   
endtask : process_${direction_tx}_traffic


`pragma protect end


`endif // __UVMA_${name_uppercase}_LAYER_MON_${layer_name_uppercase}_SV__
