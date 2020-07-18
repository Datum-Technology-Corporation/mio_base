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


`ifndef __UVME_${name_uppercase}_VSEQ_BASE_SV__
`define __UVME_${name_uppercase}_VSEQ_BASE_SV__


/**
 * Abstract object from which all other ${name_normal_case} virtual sequences extend.
 * Does not generate any sequence items of its own. Subclasses must be run on
 * ${name_normal_case} Virtual Sequencer (uvme_${name}_vsqr_c) instance.
 */
class uvme_${name}_vseq_base_c extends uvm_sequence#(
  .REQ(uvm_sequence_item),
  .RSP(uvm_sequence_item)
);
  
  // Environment handles
  uvme_${name}_cfg_c    cfg;
  uvme_${name}_cntxt_c  cntxt;
  
  
  `uvm_object_utils(uvme_${name}_vseq_base_c)
  `uvm_declare_p_sequencer(uvme_${name}_vsqr_c)
  
  
  /**
   * Default constructor.
   */
  extern function new(string name="uvme_${name}_vseq_base");
  
  /**
   * Retrieve cfg and cntxt handles from p_sequencer.
   */
  extern virtual task pre_start();
  
endclass : uvme_${name}_vseq_base_c


`pragma protect begin


function uvme_${name}_vseq_base_c::new(string name="uvme_${name}_vseq_base");
  
  super.new(name);
  
endfunction : new


task uvme_${name}_vseq_base_c::pre_start();
  
  cfg   = p_sequencer.cfg;
  cntxt = p_sequencer.cntxt;
  
endtask : pre_start


`pragma protect end


`endif // __UVME_${name_uppercase}_VSEQ_BASE_SV__
