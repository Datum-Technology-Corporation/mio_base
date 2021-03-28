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


`ifndef __UVML_IO_FILE_SV__
`define __UVML_IO_FILE_SV__


/**
 * Models a standard OS File.
 */
class uvml_io_file_c extends uvm_object;
   
   // Public
   uvml_io_file_base_enum  location_base;
   string                  directory;
   string                  custom_path;
   string                  filename;
   string                  extension;
   
   // Private
   bit           fhandle_valid  = 0;
   int unsigned  fhandle        = 0;
   
   
   `uvm_object_utils_begin(uvml_io_file_c)
      `uvm_field_enum  (uvml_io_file_base_enum, location_base, UVM_DEFAULT)
      `uvm_field_string(                        directory    , UVM_DEFAULT)
      `uvm_field_string(                        custom_path  , UVM_DEFAULT)
      `uvm_field_string(                        filename     , UVM_DEFAULT)
      `uvm_field_string(                        extension    , UVM_DEFAULT)
   `uvm_object_utils_end
   
   
   /**
    * Default constructor.
    */
   extern function new(string name="uvml_io_file");
   
   /**
    * TODO Describe uvml_io_file_c::open()
    */
   extern function bit open();
   
   /**
    * TODO Describe uvml_io_file_c::open()
    */
   extern function bit close();
   
   /**
    * TODO Describe uvml_io_file_c::readline()
    */
   extern function string readline();
   
   /**
    * TODO Describe uvml_io_file_c::write()
    */
   extern function void write(string text);
   
   /**
    * TODO Describe uvml_io_file_c::writeline()
    */
   extern function void writeline(string text);
   
   /**
    * TODO Describe uvml_io_file_c::get_path()
    */
   extern function string get_path();
   
   /**
    * TODO Describe uvml_io_file_c::is_open()
    */
   extern function bit is_open();
   
   /**
    * TODO Describe uvml_io_file_c::is_eof()
    */
   extern function bit is_eof();
   
endclass : uvml_io_file_c


function uvml_io_file_c::new(string name="uvml_io_file");
   
   super.new(name);
   
endfunction : new


function bit uvml_io_file_c::open();
   
   if (is_open()) begin
      `uvm_warning("FILE", $sformatf("Trying to open file that is already open: %s", get_path()))
   end
   else begin
      fhandle = $fopen(get_path(), "w+");
      fhandle_valid = (fhandle != 0);
   end
   
   return fhandle_valid;
   
endfunction : open


function bit uvml_io_file_c::close();
   
   if (!is_open()) begin
      `uvm_warning("FILE", $sformatf("Trying to close file that is not open: %s", get_path()))
   end
   else begin
      $fclose(fhandle);
      fhandle_valid = 0;
   end
   
   return !fhandle_valid;
   
endfunction : close


function string uvml_io_file_c::readline();
   
   if (!is_open()) begin
      `uvm_error("FILE", $sformatf("Attempting to read from file that isn't open: %s", get_path()))
   end
   else begin
      if (!is_eof()) begin
         $fgets(readline, fhandle);
      end
      else begin
         `uvm_warning("FILE", $sformatf("Trying to read past end of file: %s", get_path()))
         readline = "";
      end
   end
   
endfunction : readline


function void uvml_io_file_c::write(string text);
   
   if (!is_open()) begin
      `uvm_error("FILE", $sformatf("Attempting to write to file that isn't open: %s", get_path()))
   end
   else begin
      $fwrite(fhandle, text);
   end
   
endfunction : write


function void uvml_io_file_c::writeline(string text);
   
   write({text, "\n"});
   
endfunction : writeline


function string uvml_io_file_c::get_path();
   
   case (location_base)
      UVML_IO_FILE_BASE_CUSTOM: begin
         get_path = {custom_path, "/"};
      end
      
      default: `uvm_fatal("FILE", $sformatf("Invalid location_base: %0d", location_base))
   endcase
   
   if (extension != "") begin
      get_path = {get_path, "/", filename};
   end
   else begin
      get_path = {get_path, "/", filename, ".", extension};
   end
   
endfunction : get_path


function bit uvml_io_file_c::is_open();
   
   return fhandle_valid;
   
endfunction : is_open


function bit uvml_io_file_c::is_eof();
   
   if (is_open()) begin
      return $feof(fhandle);
   end
   else begin
      return 0;
   end
   
endfunction : is_eof


`endif // __UVML_IO_FILE_SV__
