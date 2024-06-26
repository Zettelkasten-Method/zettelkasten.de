# frozen_string_literal: true

# https://github.com/nanoc/nanoc.app/blob/master/lib/helpers/fingerprint.rb
def fingerprint(pattern)
  if !config[:is_deploying]
    'dev'
  else
    contents = @items.find_all(pattern).map do |i|
      i.binary? ? File.read(i[:filename]) : i.raw_content
    end
    Digest::SHA1.hexdigest(contents.join)[0..15]
  end
end
