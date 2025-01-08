Feature: Kolabs new
    In order to generate new applications, i want a cli that generates a new project on rails,
    with my specified configurations.

  Scenario: It generates a project with the name i specified
    When I run `kolabs new test-project`
    Then a directory named "test-project" should exist

  @no-clobber
  Scenario: A dotenv file must be present
    Then a file named "test-project/.env" should exist
    Then the file named "test-project/.env" should contain:
      """
      DATABASE_URL=
      """

  @no-clobber
  Scenario: Cors must be setted to any when the project is created
    Given I cd to "test-project"
    Then a file named "config/initializers/cors.rb" should exist
    Then the file named "config/initializers/cors.rb" should contain:
      """
      # frozen_string_literal: true
      
      # Be sure to restart your server when you modify this file.
      
      # Avoid CORS issues when API is called from the frontend app.
      # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.
      
      # Read more: https://github.com/cyu/rack-cors
      
      Rails.application.config.middleware.insert_before 0, Rack::Cors do
          allow do
              origins '*' # TODO: Change to Front-end domain
          
              resource '*',
                       headers: :Authorization,
                       methods: %i[get post put patch delete options head],
                       expose: [:Authorization]
          end
      end
      """

  @no-clobber
  Scenario: The gems bugsnag, audit, safe delete, and kaminari must be listed in the Gemfile
    Given I cd to "test-project"
    Then a file named "Gemfile" should exist
    Then the file named "Gemfile" should contain "<gem>"

    Examples:
      | gem          |
      | kaminari     |
      | bugsnag      |
      | audited      |
      | devise       |
      | devise-jwt   |
      | dotenv-rails |
      | motor-admin  |
