# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

unless defined? LOADED_DEFAULT_CONFIG

  LOADED_DEFAULT_CONFIG = true

  Encoding.default_internal = Encoding::UTF_8

  # cache busting
  #require 'nanoc/cachebuster'
  #include Nanoc::Helpers::CacheBusting

  # image compression
  require 'nanoc/filters/image_compressor'

  # javascript concatenation
  require 'nanoc/filters/javascript_concatenator'
end
