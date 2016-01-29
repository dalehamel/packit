require 'yaml'
require 'ostruct'

module Packit
  class Config < OpenStruct
    def self.load(path)
      fail "Config file #{path} doesn't exist" unless File.exists?(path)
      config = YAML.load(File.read(path))
      self.new(config)
    end

    def initialize(*args)
      super(*args)
      validate
    end

    def validate
      fail "No build strategy provided" unless strategy
      fail "No name was provided" unless name
      fail "No version was provided" unless version

      case strategy
      when 'simple'
        fail 'No globs for where to find artifacts was provided. Tell me what to package.' unless globs
        fail "Globs should be an Array of glob strings, but you gave me a #{globs.class}" unless globs.is_a?(Array)
      when 'pbuilder'
      else
        "Build strategy #{strategy} is not supported"
      end

    end

    def get_binding
      binding()
    end

# common DEBIAN files
  # reference to post / pre hook templates
  # control
  # copyright
# type
  # dpkg-deb
    # build
      # binary
      # simple script / makefile
    # globs
    # links
    # prefix
    # configs
  # pbuilder
   # generate DEBIAN files
   # provide makefiles / rules, standard DH stuff
   # User writes:
    # yaml file
    # compat
    # rules file
  end
end
