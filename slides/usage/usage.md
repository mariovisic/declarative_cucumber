<!SLIDE web-steps>
# "Cucumber is hard, let's make it easier!"

* Learning all this is hard, a new DSL, BDD, all these steps
* web_steps.rb were added to make it easier
* But they just made everyone write their features badly
* Now no longer generated (old projects might still have it)

<!SLIDE remove-web-steps>

![Remove web steps](remove_web_steps.png)

<!SLIDE usage-title>
# Examples

* Starting with what you should avoid doing

<!SLIDE usage-learner-title>
# Imperative

* Imperative means that you write each step that needs to be taken to complete the outcome, for example:

* "Fill in the email form input"
* "Press the button submit button"

<!SLIDE usage-learner-example>
    @@@ cucumber

    # features/user/authentication.feature
    Feature: Authentication (Imperative)
      As A User
      In order to gain access to skynet
      I want to be able to login and logout

      Background:
        Given the following user exists:
          | email   | password |
          | z@b.com | giraffes |

<!SLIDE usage-learner-example-1b>
    @@@ cucumber

    # features/user/authentication.feature
    Scenario: Logging in
      Given I am on the login page
      When I fill in "Email" with "z@b.com"
      And I fill in "Password" with "giraffes"
      And I press "Sign in"
      Then I should see "Signed in"

<!SLIDE usage-learner-example-3>
# Problems with imperative steps

* It doesn't read well in English (too long)
* It's hard to use it for BDD (Need to know how all of the UI works beforehand)
* Clients couldn't write scenarios without a developers help
* If we can't read it then why not just use capybara directly? It's going to be much easier than learning cucumber


<!SLIDE usage-own-title>
# Surely we can reduce some of these steps?
* Also why is the users email and password important? Surely I shouldn't have to write that?
<!SLIDE usage-example>
    @@@ cucumber

    # features/user/authentication.feature
    Feature: Authentication (Imperative with Shortcuts)
      As A User
      In order to gain access to skynet
      I want to be able to login and logout

      Scenario: Logging in
        Given I have a valid account
        And I am on the login page
        When I fill in my user details
        And I press "Sign in"
        Then I should see "Signed in"
<!SLIDE usage-example-2>
    @@@ ruby
    # features/step_definitions/authentication.rb
    Given /^I have a valid account$/ do
      @current_email = 'my@email.com'
      @current_password = 'candles'
      @current_user = FactoryGirl.create(:user,
        :email => @current_email,
        :password => @current_password)
    end

<!SLIDE usage-example-3>
    @@@ ruby
    # Please do not do this. More on this later.
    When /^I fill in my user details$/ do
      step %{I fill in "Email" with "#{@current_email}"}
      step %{I fill in "Password" with "#{@current_password}"}
    end

<!SLIDE usage-example-4>
# Problems with keeping imperative style

* Steps are easier to read but still do not match a story we would
  define for a feature

<!SLIDE declarative-own-title>
# Delclarative Steps

Declarative means that you write the outcome for the scenario,
which is how we write our user stories and how a client thinks of the
parts of their project.

An example would be "Given a user has an
account, they should be able to login"

The individual steps are not as important.

<!SLIDE declarative-own-example-4>

    @@@ cucumber
    # features/user/authentication.feature
    Feature: Authentication (No Web Steps, Declarative)
      As A User
      In order to gain access to skynet
      I want to be able to login and logout

      Scenario: Logging in
        Given I have a valid account
        Then I should be able to login

<!SLIDE declarative-own-example-5>
    @@@ ruby
    # features/step_definitions/authentication.rb
    Then /^I should be able to login$/ do
      visit new_user_session_path
      fill_in_my_details
      click_button 'Sign in'
      page.should have_content 'Signed in'
    end

<!SLIDE declarative-own-example-6>
# Where do we put the `fill_in_my_details` method?

<!SLIDE declarative-own-example-6>
    @@@ ruby
    # features/support/helpers/authentication_helper.rb
    module AuthenticationHelper
      def fill_in_my_details
        fill_in 'Email', :with => @current_email
        fill_in 'Password', :with => @current_password
      end
    end

    World(AuthenticationHelper)

<!SLIDE declarative-own-example-7>
# Why is Declarative better?

* It's easy for clients and developers to read
* Scenarios can match actual user stories
* Feature files only need altering if the user stories change.
