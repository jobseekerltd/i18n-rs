extern crate libc;
extern crate hoedown;

use std::ffi::{CString,CStr};
use hoedown::{Markdown,Html,Render};

#[no_mangle]
pub fn libi18nrs_convert(input: *const libc::c_char) -> *const libc::c_char {
  let slice = unsafe { CStr::from_ptr(input)};

  let ins = std::str::from_utf8(slice.to_bytes()).unwrap();

  let doc = Markdown::new(ins);
  let mut renderer = Html::new(hoedown::renderer::html::Flags::empty(), 0);
  let b = renderer.render(&doc);
  let html = b.to_str().unwrap();

  let s = CString::new(html).unwrap();
  let p = s.as_ptr();
  std::mem::forget(s);
  p
}

#[no_mangle]
pub fn libi18nrs_free(ptr: *mut libc::c_char) {
 let s = unsafe { CString::from_raw(ptr) };
}
