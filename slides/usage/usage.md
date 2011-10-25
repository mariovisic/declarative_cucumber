<!SLIDE usage-title>
# The 3 stages of development

* Using web steps (Imperative)
* Using web steps as well as defining your own steps (Imperative)
* Writing Declarative steps

<!SLIDE usage-learner-title>
# Using web steps (Imperative)

<!SLIDE usage-learner-example>
    @@@ cucumber

    # features/user/authentication.feature
    Feature: Authentication (web steps)
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

<!SLIDE usage-learner-example-2>
    @@@ ruby
    # features/support/paths.rb
    module NavigationHelpers
      def path_to(page_name)
        # ...

        when /^the member(s?) sign in page$/
          new_member_session_path

        # ...
      end
    end

<!SLIDE usage-learner-example-3>
# Problems with web steps

* It doesn't read well in English
* It's hard to use it for BDD (Need to know how all of the UI works beforehand)
* Clients couldn't write scenarios without a developers help
* If we can't read it then why not just use capybara directly? It might actually be easier to
  learn than cucumber


<!SLIDE usage-own-title>
# Using web steps as well as defining your own steps (Imperative)
<!SLIDE usage-example>
    @@@ cucumber

    # features/user/authentication.feature
    Feature: Authentication (web steps + Own)
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

    When /^I fill in my user details$/ do
      Then %{I fill in "Email" with "#{@current_email}"}
      Then %{I fill in "Password" with "#{@current_password}"}
    end

<!SLIDE usage-example-3>
# Problems with keeping web steps

* Reusing steps in other steps looks ugly and can get messy
* Steps are easier to read but still do not match a story we would
  define for feature
* Scenarios are still written in imperative style (More on this in a
  second)

<!SLIDE declarative-own-title>
# Writing Declarative steps (Without any web steps)

<!SLIDE declarative-own-example>
# But firstly, what is Imperative and Declarative?
<!SLIDE declarative-own-example-2>
Imperative means that you write each step that needs to be taken to
complete the outcome, for example "fill in the email form input".
<!SLIDE declarative-own-example-3>
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

      Background:
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
