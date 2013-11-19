#!/usr/bin/env ruby

http_path    = "/" 
project_path = "." 
css_dir      = "output/css" 
sass_dir     = "content/css" 
images_dir   = "output/img"

output_style = :compressed # One of: :nested, :expanded, :compact, or :compressed.

sass_options = {
  :syntax => :scss
}
