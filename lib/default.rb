# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

unless defined? LOADED_DEFAULT_CONFIG

  LOADED_DEFAULT_CONFIG = true
  
  Encoding.default_internal = Encoding::UTF_8
  
  # include common helpers
  include Nanoc::Helpers::Blogging
  include Nanoc::Helpers::HTMLEscape
  include Nanoc::Helpers::LinkTo
  include Nanoc::Helpers::Tagging
  include Nanoc::Helpers::Rendering

  # cache busting
  require 'nanoc/cachebuster'
  include Nanoc::Helpers::CacheBusting
  
  # image compression
  require 'nanoc/filters/image_compressor'
  
  # javascript concatenation
  require 'nanoc/filters/javascript_concatenator'

  # Output a meta-tag for use in your site header. The key you supply is looked
  # up in the configuration under 'meta_data'. You can override it on a per-item
  # basis.
  #
  # Usage:
  #
  #   <%= meta_tag :keywords %>
  #
  # This will output:
  #
  #   <meta name="keywords" value="...">
  #
  # Here, '...' is either the value of @item[:keywords] or that of
  # @site.config[:keywords].
  #
  # via https://github.com/avdgaag/nanoc-template
  def meta_tag(key)
    value = @item[key] || @site.config[:meta_data][key]
    '<meta name="%s" content="%s">' % [key, value] if value
  end
  
  def extract_identifiers(route)
    regex = /(?<parent>.*\/)(?<ident>[\w\d\.\-_]+\/)$/
  
    return route[regex, :ident], route[regex, :parent]
  end
end
