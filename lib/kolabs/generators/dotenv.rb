# frozen_string_literal: true

require "thor/group"

module Kolabs
  module Generators
    # generates dotenv
    class Dotenv < Thor::Group
      include Thor::Actions

      argument :dirname, type: :string

      def create_dotenv
        puts "Creating Dotenv example"
        template("dotenv.txt", "#{dirname}/.env")
        puts "Dotenv created successfully"
      end

      def self.source_root
        "#{File.dirname(__FILE__)}/dotenv"
      end
    end
  end
end
