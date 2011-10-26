Feature: Authentication (No Web Steps, Declarative)
  As A User
  In order to gain access to skynet
  I want to be able to login and logout

  Scenario: Logging in
    Given I have a valid account
    Then I should be able to login
