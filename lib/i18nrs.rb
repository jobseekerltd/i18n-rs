require 'i18nrs/version'
require 'ffi'

module I18nRs
  module FFI
    @path = begin
      d = $:.detect { |d| Dir["#{d}/libi18nrs*"].any? }
      if d then Dir["#{d}/libi18nrs*"].first else nil end
    end
    unless @path
      raise "Could not find the libi18nrs binary! Your installation is incomplete ..?"
    end
    extend ::FFI::Library
    ffi_lib @path
    attach_function :libi18nrs_convert, [:pointer], :pointer
    attach_function :libi18nrs_free, [:pointer], :void
  end

  def self.to_html(markdown_str)
    p_in = ::FFI::MemoryPointer.from_string(markdown_str)
    p_out = I18nRs::FFI.libi18nrs_convert(p_in)
    out = p_out.read_string
    I18nRs::FFI.libi18nrs_free(p_out)
    out
  end
end
