# encoding: utf-8

require "rubygems"
require "bundler/setup"
require "fileutils"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "tests"
  t.test_files = FileList["tests/**/*_test.rb"]
  t.verbose = true
end

SITE = "output"

def notify(msg)
  system %Q{terminal-notifier -group 'Nanoc' -title "Nanoc" -message "#{msg}"}
end

desc "remove files in output directory"
task :clean do
  puts "Removing output..."
  Dir["#{SITE}/*"].each { |f| rm_rf(f) }
end

desc "generate website in output directory"
task :generate do
  puts "Generating website..."
  system "nanoc co --env=production"
  notify("Generating site finished")
end

desc "Deploy to production/live website"
task :deploy => [:generate, :thumb] do
  puts "Deploying website to server..."
  system "nanoc deploy production"
  notify("Deploying site finished")
end

desc "Deploy to staging/preview site"
task :staging => [:thumb] do
  puts "Generating website for staging..."
  system "nanoc co --env=staging"
  notify "Generating stating site finished"
  system "nanoc deploy staging"
end

def to_thumb(file, output, width)
  system(
    'magick',
    file,
    '-resize',
    width.to_s,
    output
  )
end

desc "Create thumbnails of blog post images"
task :thumb do
  puts "Creating missing thumbnails ..."

  dest = File.join(__dir__, "output", "img", "blog")

  FileUtils.mkpath(dest)

  Dir[File.join(__dir__, "blog_img", "*")].each do |path|
    file = File.basename(path)

    out_large = File.join(dest, file)
    out_thumb = File.join(dest, file).pathmap "%X-thumbnail%x"

    unless File.exist?(out_large) || File.exist?(out_thumb)
      puts "... #{file}"

      to_thumb(path, out_large, 1200)
      to_thumb(path, out_thumb, 500)
    end
  end

  puts "... done."
end

desc "Generate the whole site."
task :generate_all => [ :thumb, :generate ]

task :default => :generate_all
