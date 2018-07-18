Feature: BBC Login

  Scenario: Inputting incorrect username and password credentials shows an error
  Given I access the BBC login page
  And I input incorrect username details
  And I input incorrect password details
  When I try to Login
  Then I receive an error

  Scenario: Inputting correct username and incorrect password shows an error
  Given I access the BBC login page
  And I input correct username details
  And I input incorrect password details
  When I try to Login
  Then I receive a wrong password error

  Scenario: Inputting correct username and short password shows an error
  Given I access the BBC login page
  And I input correct username details
  And I input password that is too short
  When I try to Login
  Then I receive a short password error
