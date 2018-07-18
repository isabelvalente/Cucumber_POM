Given("I access the BBC login page") do
  @bbc_site = BBC_Site.new
  @bbc_site.bbc_homepage.visit_home_page
  @bbc_site.bbc_homepage.click_sign_in_link
end

Given("I input incorrect username details") do
  @bbc_site.bbc_login.fill_wrong_email
end

Given("I input incorrect password details") do
  @bbc_site.bbc_login.fill_wrong_password
end

When("I try to Login") do
  @bbc_site.bbc_login.click_submit
end

Then("I receive an error") do
  expect(@bbc_site.bbc_login.wrong_email_error).to be true
end

Given("I input correct username details") do
  @bbc_site.bbc_login.fill_email
end

Then("I receive a wrong password error") do
  expect(@bbc_site.bbc_login.wrong_password_error).to be true
end

Given("I input password that is too short") do
  @bbc_site.bbc_login.fill_short_password
end
