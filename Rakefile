#!/usr/bin/env ruby
require 'redmine_plugin_support'

Dir[File.expand_path(File.dirname(__FILE__)) + "/lib/tasks/**/*.rake"].sort.each { |ext| load ext }

RedminePluginSupport::Base.setup do |plugin|
  plugin.project_name = 'redmine_wiki_issue_details'
  plugin.default_task = [:doc]
end
begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "redmine_wiki_issue_details"
    s.summary = "This plugin adds a wiki macro to make it easier to list the details of issues on a wiki page."
    s.email = "edavis@littlestreamsoftware.com"
    s.homepage = "https://projects.littlestreamsoftware.com/projects/redmine-misc"
    s.description = "This plugin adds a wiki macro to make it easier to list the details of issues on a wiki page."
    s.authors = ["Eric Davis"]
    s.rubyforge_project = "littlestream"
    s.files =  FileList[
                        "[A-Z]*",
                        "init.rb",
                        "rails/init.rb",
                        "{bin,generators,lib,test,app,assets,config,lang}/**/*",
                        'lib/jeweler/templates/.gitignore'
                       ]
  end
  Jeweler::GemcutterTasks.new
  Jeweler::RubyforgeTasks.new do |rubyforge|
    rubyforge.doc_task = "doc"
  end
rescue LoadError
  puts "Jeweler, or one of its dependencies, is not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

