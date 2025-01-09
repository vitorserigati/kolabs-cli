# frozen_string_literal: true

require "kolabs/generators/rails"
require "kolabs/generators/dotenv"
require "kolabs/generators/cors"
require "kolabs/generators/gem_inclusion"
require "thor"

module Kolabs
  # main cli class
  class Cli < Thor
    # Your code goes here...
    desc "new <name>", "Creates a new project"
    long_desc <<~HELP
      The new command is used to create a new rails API ONLY project.The following gems will be installed by default:

      "kaminari", "bugsnag", "audited", "devise", "devvise-jwt", "dotenv-rails", "motor-admin", "rack-cors", "bcrypt" and "jbuilder"

      command:
        kolabs new <name>

      A new rails project will be created on the currect directory with the specified name
    HELP
    def new(name)
      Kolabs::Generators::Rails.start([name])
      Kolabs::Generators::Dotenv.start([name])
      Kolabs::Generators::Cors.start([name])
      Kolabs::Generators::GemInclusion.perform(name)
    end
  end
end
