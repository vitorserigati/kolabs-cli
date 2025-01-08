# frozen_string_literal: true

require "thor/group"

module Kolabs
  module Generators
    # Generates cors file
    class Cors < Thor::Group
      include Thor::Actions

      argument :dirname, type: :string
      def create_cors
        puts "Updating cors"
        template("cors.txt", "#{dirname}/config/initializers/cors.rb", { force: true })
      end

      def self.source_root
        "#{File.dirname(__FILE__)}/cors"
      end
    end
  end
end
