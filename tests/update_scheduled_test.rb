#!/usr/bin/env ruby
# frozen_string_literal: true

require "minitest/autorun"
require "tmpdir"
require "fileutils"
require_relative "../script/update_scheduled"

class ScannerTest < Minitest::Test
  def setup
    @tmp_dir = Dir.mktmpdir
  end

  def teardown
    FileUtils.remove_entry(@tmp_dir)
  end

  def test_finds_future_dated_post
    create_post("future.md", "2030-06-15T10:00:00+02:00")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_equal 1, dates.length
    assert_equal 2030, dates.first.year
  end

  def test_ignores_past_dated_post
    create_post("past.md", "2020-01-01T10:00:00+01:00")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_empty dates
  end

  def test_ignores_post_without_frontmatter
    File.write(File.join(@tmp_dir, "no_frontmatter.md"), "Just some content")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_empty dates
  end

  def test_ignores_post_without_created_at
    content = <<~POST
      ---
      title: "No date"
      ---
      Content here
    POST
    File.write(File.join(@tmp_dir, "no_date.md"), content)
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_empty dates
  end

  def test_finds_posts_in_subdirectories
    subdir = File.join(@tmp_dir, "2030", "06")
    FileUtils.mkdir_p(subdir)
    create_post("2030/06/nested.md", "2030-06-15T10:00:00+02:00")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_equal 1, dates.length
  end

  def test_finds_txt_files
    create_post("post.txt", "2030-06-15T10:00:00+02:00")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_equal 1, dates.length
  end

  def test_returns_sorted_dates
    create_post("later.md", "2032-01-01T10:00:00+01:00")
    create_post("earlier.md", "2030-01-01T10:00:00+01:00")
    create_post("middle.md", "2031-01-01T10:00:00+01:00")
    now = Time.new(2025, 1, 1, 12, 0, 0, "+01:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now)
    dates = scanner.future_dates

    assert_equal [2030, 2031, 2032], dates.map(&:year)
  end

  def test_handles_timezone_correctly
    create_post("berlin.md", "2025-01-15T06:00:00+01:00")
    now_utc = Time.new(2025, 1, 15, 4, 30, 0, "+00:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now_utc)
    dates = scanner.future_dates

    assert_equal 1, dates.length
  end

  def test_timezone_post_is_past_when_time_has_passed
    create_post("berlin.md", "2025-01-15T06:00:00+01:00")
    now_utc = Time.new(2025, 1, 15, 5, 30, 0, "+00:00")

    scanner = ScheduledPosts::Scanner.new(posts_dir: @tmp_dir, now: now_utc)
    dates = scanner.future_dates

    assert_empty dates
  end

  private

  def create_post(relative_path, created_at)
    path = File.join(@tmp_dir, relative_path)
    FileUtils.mkdir_p(File.dirname(path))
    content = <<~POST
      ---
      title: "Test Post"
      created_at: #{created_at}
      kind: article
      ---
      Content here
    POST
    File.write(path, content)
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
