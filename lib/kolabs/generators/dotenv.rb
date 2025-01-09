# frozen_string_literal: true

require "thor/group"

module Kolabs
  module Generators
    # generates dotenv
    class Dotenv < Thor::Group
      include Thor::Actions

      argument :dirname, type: :string

      def create_dotenv
        say "Creating Dotenv example", :yellow
        template("dotenv.txt", "#{dirname}/.env")
        say "Dotenv created successfully", :green
      end

      def self.source_root
        "#{File.dirname(__FILE__)}/dotenv"
      end
    end
  end
end
