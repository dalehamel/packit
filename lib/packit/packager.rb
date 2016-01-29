require 'packit/config'
require 'packit/control'

module Packit
  class Packager
    def self.pack(config: nil)
      config ||= File.join(Dir.pwd, 'packit.yml')
      debconf = Config.load(config)

      case debconf.strategy
      when 'simple'
        DpkgDeb.new(debconf).package
      when 'pbuilder'
        Pbuilder.new(debconf).package
      else
        "Build strategy #{config.strategy} is not supported"
      end
    end

    def initialize(debconf)
      @debconf = debconf
      @control = Control.render(@debconf)
    end
  end
end
