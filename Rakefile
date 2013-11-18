# encoding: utf-8

require "rubygems"
require "bundler/setup"

require 'nanoc3/tasks'

PORT = "4000"
SITE = "output"
DEPLOY_BRANCH = "deploy"

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
end

desc "build and commit the website in the master branch"
task :build => :generate_all do
  require 'git'
  repo = Git.open('.')
  
  source_branch = repo.branches.to_s.split("\n").delete_if { |s| s[0] != "*" }
  source_branch = source_branch.first.gsub("* ","")
  
  repo.branch(DEPLOY_BRANCH).checkout
  
  puts "Preparing deployment branch ..."
  # remove all data except /output and move /output/* dir to /
  (Dir["*"] - [SITE]).each { |f| rm_rf(f) }
  Dir["#{SITE}/*", "#{SITE}/.htaccess"].each { |f| mv(f, ".") }
  rm_rf(SITE)
  
  puts "Committing for deployment ..."
  # add html output to git repo
  Dir["**/*", ".htaccess"].each { |f| repo.add(f) }
  repo.status.deleted.each { |f, s| repo.remove(f) }
  message = ENV["MESSAGE"] || "Site updated at #{Time.now.utc}"
  repo.commit(message)
  puts "Switching back to branch '#{source_branch}' ..."
  repo.branch(source_branch).checkout
end

desc "Generate the whole site."
task :generate_all => [ :generate ]

task :default => :generate_all
