#!/usr/bin/env rake
require "bundler/gem_tasks"
 
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.libs << 'lib/elastico'
  t.test_files = FileList['test/lib/elastico/*_test.rb']
  t.verbose = true
end
 
task :default => :test

task :build do
  system "gem build elastico.gemspec"
end
 
task :release => :build do
  system "gem push elastico-#{Elastico::VERSION}"
end