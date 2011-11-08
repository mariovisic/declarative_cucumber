<!SLIDE setup-title>

# Using
![Cucumber](cucumber.png)

<!SLIDE setup>

    @@@ ruby
    # In your Gemfile:
    gem 'cucumber-rails' # For rails projects
    gem 'cucumber'       # Otherwise

    # Install the the cucumber gem
    bundle install

    # Install cucumber in your rails app 
    # (cucumber-rails only)
    rails g cucumber:install

    # Setup the test database
    rake db:test:prepare

    # To run the test suite
    cucumber
