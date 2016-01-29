require 'thor'
require 'packit'

class Packit::CLI < Thor

  desc 'pack', 'Create a new package'
  method_option :config, type: :string, required: false, banner: 'CONFIG', desc: 'Path to config file', aliases: '-c'
  def pack
    opts = options.deep_symbolize_keys
    Packit::Packager.pack(**opts)
  end
end
