# encoding: utf-8

require "rubygems"
require "bundler/setup"
require "fileutils"

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
  ENV['NANOC_ENV'] = 'deployment'
  puts "Generating website..."
  system "nanoc co"
  notify("Generating site finished")
end

task :deploy => [:generate, :thumb] do
  ENV['NANOC_ENV'] = 'deployment'
  puts "Deploying website to server..."
  system "rm output/.htaccess" # Remove potentially modified HTACCESS from staging step
  system "nanoc deploy production"
  notify("Deploying site finished")
end

task :staging => [:thumb] do
  puts "Generating website for staging..."
  ENV['NANOC_ENV'] = 'staging'
  system "rm output/.htaccess" # Remove HTACCESS to regernate it during staging
  system "nanoc co"
  notify "Generating stating site finished"

  system "nanoc deploy staging"
end

def to_thumb(file, output, width)
  system(
    'convert',
    '-resize',
    width.to_s,
    file,
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

    unless File.exists?(out_large) || File.exists?(out_thumb)
      puts "... #{file}"

      to_thumb(path, out_large, 1200)
      to_thumb(path, out_thumb, 500)
    end
  end

  puts "... done."
end

desc "Generate the whole site."
task :generate_all => [ :generate ]

task :default => :generate_all
