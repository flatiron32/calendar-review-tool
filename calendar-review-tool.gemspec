# Ensure we require the local version and not one we might have installed already
require File.join([File.dirname(__FILE__),'lib','calendar-review-tool','version.rb'])
spec = Gem::Specification.new do |s| 
  s.name = 'calendar-review-tool'
  s.version = CalendarReviewTool::VERSION
  s.author = 'Your Name Here'
  s.email = 'your@email.address.com'
  s.homepage = 'http://your.website.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'A description of your project'
  s.files = `git ls-files`.split("
")
  s.require_paths << 'lib'
  s.has_rdoc = true
  s.extra_rdoc_files = ['README.rdoc','calendar-review-tool.rdoc']
  s.rdoc_options << '--title' << 'calendar-review-tool' << '--main' << 'README.rdoc' << '-ri'
  s.bindir = 'bin'
  s.executables << 'calendar-review-tool'
  s.add_development_dependency('rake')
  s.add_development_dependency('rdoc')
  s.add_development_dependency('aruba')
  s.add_development_dependency('mocha')
  s.add_runtime_dependency('gli','2.13.1')
end
