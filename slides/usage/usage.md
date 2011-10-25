<!SLIDE usage-title>
# The 4 stages

* Web Steps (Imperative)
* Writing your own steps (Imperative)
* No Web Steps (Declarative)
* Reusability again (Declarative)

<!SLIDE usage-learner-title>

# The learner

<!SLIDE usage-learner-example>

    @@@ cucumber
    # features/user/authentication.feature

    Feature: Authentication
      As A User
      In order to gain access to sknet
      I want to be able to login and logout

    Scenario: Logging in
      Given I am on the login page
      When I fill in "Email" with "z@b.com"
      And I fill in "Password" with "giraffes"
      And I press "Sign In"
      Then I should see "Signed in"
      And I should be on the dashboard

<!SLIDE usage-learner-example-2>
    @@@ ruby
    # features/support/paths.rb
    module NavigationHelpers
      def path_to(page_name)
        # ...

        when /^the member(s?) sign in page$/
          new_member_session_path

        when /^the dashboard$/
          dashboard_path

        # ...
      end
    end
