Given("I access the BBC registration page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_go_to_register
end

Given("I click the under thirteen button") do
  @bbc_site.bbc_registration.click_under_13
end

Given("I am redirected to the under thirteen registration page") do
  @bbc_site.bbc_registration.under_13_register_page
end

When("I input parent email") do
  @bbc_site.bbc_registration.fill_parent_email
end

Then("I should be redirected to a page that says email sent") do
  @bbc_site.bbc_registration.email_sent_page
end

Given("I click the over thirteen button") do
  @bbc_site.bbc_registration.click_13_or_over
end

Given("I input a date that is less than thirteen years ago") do
  @bbc_site.bbc_registration.fill_in_wrong_dob
end

When("I click continue") do
  @bbc_site.bbc_registration.click_dob_button
end

Then("I should see an error message that says I should be thirteen or over") do
  @bbc_site.bbc_registration.too_young
end

Given("I access the BBC registration page as someone over thirteen years old") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
  @bbc_site.bbc_homepage.click_go_to_register
  @bbc_site.bbc_registration.click_13_or_over
  @bbc_site.bbc_registration.fill_in_dob
  @bbc_site.bbc_registration.click_dob_button
end

Given("I enter an email address that does not contain an @ symbol") do
  @bbc_site.bbc_registration.fill_in_invalid_email
end

When("I click the password field") do
  @bbc_site.bbc_registration.click_password
end

Then("I should see an error message that says the email does not look right") do
  @bbc_site.bbc_registration.email_incorrect
end

Given("I input a valid email address") do
  @bbc_site.bbc_registration.fill_in_email
end

Given("I input a password that is less than eight characters long") do
  @bbc_site.bbc_registration.short_password
end

When("I click the postcode field") do
  @bbc_site.bbc_registration.click_postcode
end

Then("I should see an error message that says the password is too short") do
  @bbc_site.bbc_registration.short_password_error
end

Given("I input a password that contains no letters") do
  @bbc_site.bbc_registration.no_letter_password
end

Then("I should see an error message that says the password is not valid") do
  @bbc_site.bbc_registration.no_letter_password_error
end
