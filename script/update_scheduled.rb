#!/usr/bin/env ruby
# frozen_string_literal: true

require "time"
require "yaml"

module ScheduledPosts
  class Scanner
    def initialize(posts_dir:, now: Time.now)
      @posts_dir = posts_dir
      @now = now
    end

    def future_dates
      dates = []

      Dir[File.join(@posts_dir, "**/*.{md,txt}")].each do |path|
        date = extract_created_at(path)
        dates << date if date && date > @now
      end

      dates.sort
    end

    private

    def extract_created_at(path)
      content = File.read(path)
      return unless content =~ /\A---\n(.*?)\n---/m

      front = YAML.safe_load(Regexp.last_match(1), permitted_classes: [Time, Date])
      parse_time(front["created_at"])
    rescue StandardError
      nil
    end

    def parse_time(value)
      case value
      when Time then value
      when Date then value.to_time
      when String then Time.parse(value)
      end
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
  posts_dir = ARGV[0] || "content/posts"
  output_path = ARGV[1] || ".scheduled"

  scanner = ScheduledPosts::Scanner.new(posts_dir: posts_dir)
  writer = ScheduledPosts::Writer.new(path: output_path)

  dates = scanner.future_dates
  writer.write(dates)

  puts "Found #{dates.length} scheduled post(s)"
end
