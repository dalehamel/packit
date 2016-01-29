require 'tmpdir'
require 'fileutils'

module Packit
  class DpkgDeb < Packager

    def package
      build if @debconf.script
      prepare
      archive
    end

  private

    def build
      system(@debconf.script)
    end

    def prepare
      tmpdir = Dir.mktmpdir("dpkg-#{@debconf.name}")
      @pkgdir = File.join(tmpdir, "#{@debconf.name}_#{@debconf.version}")
      @prefix = @debconf.prefix || "/usr/local/#{@debconf.name}"
      @debconf.globs.each do |glob|
        Dir[glob].each do |entry|
          target = File.join(@pkgdir, @prefix, entry)
          if File.directory?(entry)
            FileUtils.mkdir_p(target)
          elsif File.file?(entry)
            FileUtils.mkdir_p(File.dirname(target))
            FileUtils.cp(entry, target)
          else
            fail "I can't handle #{entry} it is neither a file nore a directory"
          end
        end
      end
      @debdir = File.join(@pkgdir, 'DEBIAN')
      FileUtils.mkdir_p(@debdir)
      File.write(File.join(@debdir, 'control'), @control)
    end

    def archive
      system("dpkg-deb --build #{@pkgdir}")
      #FileUtils.mv(
    end
  end
end
