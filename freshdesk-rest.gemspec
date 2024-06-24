lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'freshdesk-rest/version'
require 'time'

Gem::Specification.new do |s|
  s.name        = 'freshdesk-rest'
  s.version     = Freshdesk::Rest::VERSION
  s.date        = Time.new.strftime('%Y-%m-%d')
  s.summary     = 'Freshdesk rest api resource collection'
  s.description = 'A ruby gem to interact with Freshdesk REST resources'
  s.authors     = ['Helpling']
  s.email       = 'tech@helpling.com'
  s.files       = `git ls-files ./lib`.split($RS)
  s.homepage    = 'https://rubygems.org/gems/freshdesk-rest'
  s.metadata    = { 'source_code_uri' => 'https://github.com/Helpling/freshdesk-rest' }
  s.license     = 'MIT'
  s.add_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  s.add_development_dependency 'rspec', '~> 3.8'
  s.add_development_dependency 'webmock', '~> 3.4', '>= 3.4.2'
end
