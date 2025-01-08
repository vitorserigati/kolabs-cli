# frozen_string_literal: true

require "thor/group"

module Kolabs
  module Generators
    # Generates a new rails project
    class Rails < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def create_project
        puts "Creating rails project"
        system("rails new #{name} --api -d postgresql -T -B")
        puts "Project created succcessfully"
      end
    end
  end
end
