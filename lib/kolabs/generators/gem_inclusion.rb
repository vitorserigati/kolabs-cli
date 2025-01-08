# frozen_string_literal: true

require "fileutils"
require "tempfile"

module Kolabs
  module Generators
    # adds new gems
    class GemInclusion
      def self.perform(dirname) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
        tempfile = Tempfile.create
        template_path = "#{File.dirname(__FILE__)}/gem_inclusion/gem_inclusion.txt"
        template = File.read(template_path)
        gem_to_uncomment = %w[jbuilder rack-cors bcrypt]

        Dir.chdir(dirname) do
          gemfile = File.readlines("Gemfile")
          gemfile.each do |line|
            if gem_to_uncomment.any? { |g| line.include? "# gem \"#{g}\"" }
              tempfile.puts line.gsub(/^\s*#\s*/, "")
            else
              tempfile.puts line
            end
          end
          tempfile.puts template
          tempfile.close
          FileUtils.mv tempfile.path, "Gemfile"
        end
      end
    end
  end
end
