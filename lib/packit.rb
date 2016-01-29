$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'active_support/all'
require 'packit/version'
require 'packit/config'
require 'packit/packager'
require 'packit/dpkg_deb'
#require 'packit/pbuilder'

