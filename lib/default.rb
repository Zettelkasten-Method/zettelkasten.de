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

  def full_page_title
    item_title = item_title_only
    result = ""
    result += item_title + " &bull; " if item_title
    result += @config[:meta_data][:title]
    result
  end

  def item_title_only
    return nil unless @item[:title]
    remove_html_tags(@item[:title])
  end

  def remove_html_tags(string)
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    string.gsub(re, '')
  end
end
