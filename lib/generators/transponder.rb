require 'rails/generators'
require 'rails/generators/named_base'

module Transponder
  module Generators
    class Base < Rails::Generators::NamedBase

      def javascripts_path
        "app/assets/javascripts"
      end

      def self.source_root
        @_transponder_source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'transponder', generator_name, 'templates'))
      end

      def self.banner
        "rails generate transponder:#{generator_name} #{self.arguments.map{ |a| a.usage}.join(' ')} [options]"
      end

      private

      def print_usage
        self.class.help(Thor::Base.shell.new)
        exit
      end
    end
  end
end