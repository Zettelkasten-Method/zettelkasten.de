#!/usr/bin/env ruby
# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require "fileutils"
require_relative "../script/update_scheduled"

class ScannerTest < Minitest::Test
  FIXTURES_PATH = File.expand_path("fixtures/nanoc_site", __dir__)

  def test_finds_future_dated_items
    Dir.chdir(FIXTURES_PATH) do
      now = Time.new(2025, 1, 1)
      scanner = ScheduledPosts::Scanner.new(now: now)
      dates = scanner.future_dates

      assert_equal 5, dates.length
    end
  end

  def test_ignores_past_dated_article
    Dir.chdir(FIXTURES_PATH) do
      now = Time.new(2025, 1, 1)
      scanner = ScheduledPosts::Scanner.new(now: now)
      dates = scanner.future_dates

      refute dates.any? { |d| d.year == 2020 }
    end
  end

  def test_ignores_article_without_created_at
    Dir.chdir(FIXTURES_PATH) do
      now = Time.new(2025, 1, 1)
      scanner = ScheduledPosts::Scanner.new(now: now)
      dates = scanner.future_dates

      assert dates.all? { |d| d.is_a?(Time) }
    end
  end

  def test_finds_posts_in_subdirectories
    Dir.chdir(FIXTURES_PATH) do
      now = Time.new(2025, 1, 1)
      scanner = ScheduledPosts::Scanner.new(now: now)
      dates = scanner.future_dates

      assert dates.any? { |d| d.month == 7 && d.year == 2030 }
    end
  end

  def test_returns_sorted_dates
    Dir.chdir(FIXTURES_PATH) do
      now = Time.new(2025, 1, 1)
      scanner = ScheduledPosts::Scanner.new(now: now)
      dates = scanner.future_dates

      years = dates.map(&:year)
      assert_equal years.sort, years
    end
  end

  def test_handles_timezone_correctly
    Dir.chdir(FIXTURES_PATH) do
      now_utc = Time.new(2030, 6, 15, 7, 30, 0, "+00:00")
      scanner = ScheduledPosts::Scanner.new(now: now_utc)
      dates = scanner.future_dates

      future_june_15 = dates.select { |d| d.year == 2030 && d.month == 6 && d.day == 15 }
      assert_equal 2, future_june_15.length
    end
  end

  def test_timezone_post_is_past_when_time_has_passed
    Dir.chdir(FIXTURES_PATH) do
      now_utc = Time.new(2030, 6, 15, 9, 0, 0, "+00:00")
      scanner = ScheduledPosts::Scanner.new(now: now_utc)
      dates = scanner.future_dates

      future_june_15 = dates.select { |d| d.year == 2030 && d.month == 6 && d.day == 15 }
      assert_empty future_june_15
    end
  end
end

class WriterTest < Minitest::Test
  def setup
    @tmp_dir = Dir.mktmpdir
    @output_path = File.join(@tmp_dir, ".scheduled")
  end

  def teardown
    FileUtils.remove_entry(@tmp_dir)
  end

  def test_writes_dates_as_iso8601
    writer = ScheduledPosts::Writer.new(path: @output_path)
    dates = [Time.new(2030, 6, 15, 10, 0, 0, "+02:00")]

    writer.write(dates)

    content = File.read(@output_path)
    assert_match(/2030-06-15T10:00:00\+02:00/, content)
  end

  def test_writes_empty_file_for_no_dates
    writer = ScheduledPosts::Writer.new(path: @output_path)

    writer.write([])

    assert_equal "", File.read(@output_path)
  end

  def test_writes_multiple_dates_on_separate_lines
    writer = ScheduledPosts::Writer.new(path: @output_path)
    dates = [
      Time.new(2030, 1, 1, 10, 0, 0, "+01:00"),
      Time.new(2031, 1, 1, 10, 0, 0, "+01:00")
    ]

    writer.write(dates)

    lines = File.read(@output_path).lines.map(&:chomp)
    assert_equal 2, lines.length
  end
end
