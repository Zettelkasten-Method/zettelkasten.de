source 'https://rubygems.org'

group 'nanoc' do
  gem 'nanoc'
  gem 'nanoc-live'
  gem 'webrick', '~> 1.7'  # Ruby 3.x doesn't ship with WEBrick anymore
  gem 'nanoc-image-compressor'
  gem 'nanoc-javascript-concatenator'
end

gem 'dotenv', '~> 2'
gem 'sass', '~> 3'
gem 'compass', '~> 1'
gem 'terser', '~> 1.1'

# Blogging
gem 'activesupport'

# Minify
gem 'rainpress',  '~>1.0' # CSS Compressor
gem 'jsmin',      '~>1.0'

# Markdown & Typography
gem "kramdown", "~> 2.4"
gem 'kramdown-parser-gfm'
gem 'rouge' # syntax highlighting
gem 'typogruby' # Fallback when Redcarpet is not available

# Uglifying
gem 'uglifier'
gem 'multi_json', '~> 1.3' # needed by uglifier

# needed for tasks
gem 'rake'
gem 'terminal-notifier'

# needed to run nanoc autocompile
gem 'rack', ">= 2.0.6"
gem 'mime-types'
gem 'i18n'

# needed to run nanoc view
gem 'adsf'

# needed to run nanoc deploy
gem 'systemu'

# needed to run validations
gem 'w3c_validators'
gem 'nokogiri', ">= 1.8.5"

# XML Sitemap
gem 'builder'
