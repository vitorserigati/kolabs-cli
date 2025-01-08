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
    desc "new NAME", "Creates a new project"
    def new(name)
      Kolabs::Generators::Rails.start([name])
      Kolabs::Generators::Dotenv.start([name])
      Kolabs::Generators::Cors.start([name])
      Kolabs::Generators::GemInclusion.perform(name)
    end
  end
end
