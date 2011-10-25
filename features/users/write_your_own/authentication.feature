Feature: Authentication (Web steps + Own Steps)
  As A User
  In order to gain access to sknet
  I want to be able to login and logout

  Scenario: Logging in
    Given I have a valid account
    And I am on the login page
    When I fill in my user details
    And I press "Sign in"
    Then I should see "Signed in"
