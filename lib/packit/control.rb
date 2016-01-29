require 'erb'

module Packit
  module Control
    extend self

    def render(config)
      template = <<-eos
Package: <%= name %>
Architecture: <%= arch || 'all' %>
Maintainer: <%= author %>
Depends: <%= (depends && depends.is_a?(Array) && !depends.empty?) || 'debconf' %>
<%- if conflicts && conflicts.is_a?(Array) && !conflicts.empty? -%>
Conflicts: <%= conflicts.join(', ') %>
<%- end -%>
<%- if section -%>
Section: <%= section %>
<%- end -%>
Priority: <%= priority || 'optional' %>
Version: <%= version %>
Description: <%= description || "Awesome package" %>
       eos
      renderer = ERB.new(template, nil, '-')
      renderer.result(config.get_binding)
    end
  end
end


#https://github.com/Shopify/ruby/blob/debian_pbuilder/debian/control.erb

#Source: shopify-ruby-<%= version %>
#Section: ruby
#Priority: optional
#Maintainer: Shopify Ops <ops@shopify.com>
#Build-Depends: debhelper (>= 7.3), autoconf, bison, build-essential, devscripts, equivs, libreadline-gplv2-dev | libreadline-dev, ruby1.9.3|ruby, libssl-dev (>= 0.9.6b), libyaml-dev, zlib1g-dev, systemtap-sdt-dev, libffi-dev
#Standards-Version: 3.9.4
#Homepage: https://github.com/Shopify/ruby
#Vcs-Git: git://github.com/Shopify/ruby.git
#Vcs-Browser: https://github.com/Shopify/ruby
#
#Package: shopify-ruby-<%= version %>
#Architecture: any
#Depends: ${shlibs:Depends}, ${misc:Depends}
#Recommends: shopify-ruby
#Provides: shopify-ruby-any, shopify-ruby-<%= major_minor %>
#Suggests: shopify-ruby-<%= version %>-doc
#Description: Ruby <%= version %> for Shopify servers
# Built using shopify-ruby-build.
#
#Package: shopify-ruby-<%= version %>-doc
#Architecture: any
#Description: Ruby <%= version %> for Shopify servers (documentation)
# Built using shopify-ruby-build.
