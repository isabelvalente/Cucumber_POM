Feature: BBC Registration

  Scenario: Registering as someone under thirteen years old
  Given I access the BBC registration page
  And I click the under thirteen button
  And I am redirected to the under thirteen registration page
  When I input parent email
  Then I should be redirected to a page that says email sent

  Scenario: Registering as someone over thirteen years old with a date that is less than thirteen years ago
  Given I access the BBC registration page
  And I click the over thirteen button
  And I input a date that is less than thirteen years ago
  When I click continue
  Then I should see an error message that says I should be thirteen or over

  Scenario: Registering with an invalid email
  Given I access the BBC registration page as someone over thirteen years old
  And I enter an email address that does not contain an @ symbol
  When I click the password field
  Then I should see an error message that says the email does not look right

  Scenario: Registering with a password that is less thant eight characters long
  Given I access the BBC registration page as someone over thirteen years old
  And I input a valid email address
  And I input a password that is less than eight characters long
  When I click the postcode field
  Then I should see an error message that says the password is too short

  Scenario: Registering with a password that has no letters
  Given I access the BBC registration page as someone over thirteen years old
  And I input a valid email address
  And I input a password that contains no letters
  When I click the postcode field
  Then I should see an error message that says the password is not valid
