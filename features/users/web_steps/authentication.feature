Feature: Authentication (Web Steps)
  As A User
  In order to gain access to sknet
  I want to be able to login and logout

  Background:
    Given the following user exists:
      | email   | password |
      | z@b.com | giraffes |

  Scenario: Logging in
    Given I am on the login page
    When I fill in "Email" with "z@b.com"
    And I fill in "Password" with "giraffes"
    And I press "Sign in"
    Then I should see "Signed in"
