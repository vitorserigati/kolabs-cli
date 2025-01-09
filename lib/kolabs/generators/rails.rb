# frozen_string_literal: true

require "thor/group"

module Kolabs
  module Generators
    # Generates a new rails project
    class Rails < Thor::Group
      include Thor::Actions

      argument :name, type: :string

      def create_project
        say "Creating rails project", :yellow
        system("rails new #{name} --api -d postgresql -T -B")
        say "Project created succcessfully", :green
      end
    end
  end
end
