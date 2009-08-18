require 'redmine'

Redmine::Plugin.register :redmine_wiki_issue_details do
  name 'Redmine Wiki Issue Details plugin'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description 'This plugin adds a wiki macro to make it easier to list the details of issues on a wiki page.'
  version '0.0.1'
  requires_redmine :version_or_higher => '0.8.4' # Only tested on trunk


  Redmine::WikiFormatting::Macros.register do
    desc "Display an issue and it's details.  Examples:\n\n" +
      "  !{{issue_details(100)}}\n\n" +
      "  Digitized 24 hour firmware - Bug #391 Robust disintermediate customer loyalty - 25.23 hours"
    macro :issue_details do |obj, args|
      issue_id = args[0]
      issue = Issue.visible.find_by_id(issue_id)

      return '' unless issue

      if User.current.allowed_to?(:view_estimates, issue.project)
        estimates = "- #{l_hours(issue.estimated_hours)}"
      else
        estimates = ''
      end

      project_link = link_to(h(issue.project), :controller => 'projects', :action => 'show', :id => issue.project)
        
      return "#{project_link} - #{link_to_issue(issue)} #{h(issue.subject)} #{estimates}"
    end
  end
end
