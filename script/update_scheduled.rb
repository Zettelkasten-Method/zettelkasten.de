#!/usr/bin/env ruby
# frozen_string_literal: true

require "nanoc"

module ScheduledPosts
  class Scanner
    def initialize(site: nil, now: Time.now)
      @site = site || Nanoc::Core::SiteLoader.new.new_from_cwd
      @now = now
    end

    def future_dates
      @site.items
        .filter_map { |item| item.attributes[:created_at] }
        .select { |date| date.is_a?(Time) && date > @now }
        .sort
    end
  end

  class Writer
    def initialize(path:)
      @path = path
    end

    def write(dates)
      content = dates.map(&:iso8601).join("\n")
      content += "\n" unless content.empty?
      File.write(@path, content)
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  output_path = ARGV[0] || ".scheduled"

  scanner = ScheduledPosts::Scanner.new
  writer = ScheduledPosts::Writer.new(path: output_path)

  dates = scanner.future_dates
  writer.write(dates)

  puts "Found #{dates.length} scheduled post(s)"
end
