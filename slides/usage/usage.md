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

<!SLIDE usage-learner-example-3>
# Problems with Web steps

* Hard to do BDD (Need to know how all of the UI works beforehand)
* Clients couldn't write scenarios without a developers help, doesn't
  read well
* Why not just use capybara directly? It might actually be easier to
  learn than cucumber


<!SLIDE usage-own-title>
<!SLIDE usage-example>
<!SLIDE usage-example-2>
<!SLIDE usage-example-3>

# Problems with Web steps

* Might read a bit better but still written Imperatively (You're
  describing the actions to perform not the outcomes)
