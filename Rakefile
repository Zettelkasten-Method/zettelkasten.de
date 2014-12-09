# encoding: utf-8

require "rubygems"
require "bundler/setup"
require 'nanoc3/tasks'

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
task :generate => :clean do
  ENV['NANOC_ENV'] = 'deployment'
  puts "Generating website..."
  system "nanoc co"
  notify("Generating site finished")
end

task :deploy => :generate do
  puts "Deploying website to server..."
  system "nanoc deploy"
  notify("Deploying site finished")
end

desc "Generate the whole site."
task :generate_all => [ :generate ]

task :default => :generate_all
