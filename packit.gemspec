lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'packit/version'

Gem::Specification.new do |s|
  s.name        = 'packit'
  s.version     = Packit::VERSION
  s.date        = '2016-01-27'
  s.summary     = 'Glob it up, and "pack it" into a deb'
  s.description = 'Provides a simple means of packaging arbitrary files into a debian package.'
  s.authors     = ['Dale Hamel']
  s.email       = 'dale.hamel@srvthe.net'
  s.files       = Dir['lib/**/*'] + Dir['man/**/*']
  s.executables = 'packit'
  s.homepage    =
    'http://rubygems.org/gems/packit'
  s.license = 'MIT'
  s.add_runtime_dependency 'thor',  ['0.19.1']
  s.add_runtime_dependency 'activesupport',  ['4.2.5.1']
  s.add_development_dependency 'rake', ['=10.4.2']
  s.add_development_dependency 'simplecov', ['=0.10.0']
  s.add_development_dependency 'rspec', ['=3.2.0']
  s.add_development_dependency 'md2man', ['4.0.0']
end
