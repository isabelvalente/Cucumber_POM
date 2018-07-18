require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  #Constants
  DOB_DAY = '#day_input'
  DOB_MONTH = '#month_input'
  DOB_YEAR = '#year_input'
  CONFIRM_BDAY_LINK = '#submit-button'
  REGISTRATION_SUBMIT = '#submit-button'
  CONFIRMED = 'Thanks. You\'re now signed in.'
  PARENT_EMAIL = 'breland.tanveer@lm0k.com'
  INVALID_EMAIL = 'Ivalenre.com'

  # UNDER 13 REGISTRATION
  def click_under_13
    click_link('Under 13')
  end

  def under_13_register_page
    visit('https://account.bbc.com/register/details/guardian?context=news&nonce=1U4ipp4q-NsfAFHdtumMMhQ1Y885isiUUqpw&ptrt=https%3A%2F%2Fwww.bbc.co.uk%2Fnews%2Fuk-44871799&userOrigin=news')
  end

  def fill_parent_email
    fill_in('Parent or guardian email', with: PARENT_EMAIL)
  end

  def email_sent_page
    page.has_content?('Email sent. Now check your inbox and follow the instructions')
  end


  # OVER 13 REGISTRATION
  def click_13_or_over
    click_link('13 or over')
    sleep 2
  end
    # DOB ERRORS
  def fill_in_dob
    fill_in('Day', with: '19')
    sleep 1
    fill_in('Month', with: '4')
    sleep 1
    fill_in('Year', with: '1994')
    sleep 2
  end

  def fill_in_wrong_dob
    fill_in('Day', with: '26')
    sleep 1
    fill_in('Month', with: '1')
    sleep 1
    fill_in('Year', with: '2008')
    sleep 1
  end

  def too_young
    page.has_content?('Sorry, you need to be 13 or over.')
  end

  def click_dob_button
    click_button 'Continue'
    sleep 1
  end

    # EMAIL ERRORS
  def fill_in_invalid_email
    fill_in('Email', with: INVALID_EMAIL)
  end

  def fill_in_email
    fill_in('Email', with: 'rayan.zayed@lm0k.com')
    sleep 2
  end

  def email_incorrect
    page.has_content?('Sorry, that email doesn’t look right.')
  end


    # PASSWORD ERRORS
  def fill_in_password
    fill_in('Password', with: 'Acad3my1')
    sleep 2
  end

  def short_password
    fill_in('Password', with: 'test')
  end

  def short_password_error
    page.has_content?('password is too short')
  end

  def no_letter_password
    fill_in('Password', with: '12344567')
  end

  def no_letter_password_error
    page.has_content?('Sorry, that password isn\'t valid')
  end

    # POSTCODE ERRORS
  def fill_in_postcode
    fill_in('Postcode', with: 'SE85EQ')
    sleep 1
  end

  def click_postcode
    find('#postcode-input').click
  end
    # GENDER ERRORS
  def select_gender
    select 'Other', from: 'Gender'
    sleep 1
  end

  def click_password
    find('#password-input').click
    sleep 1
  end

  def click_dob_button
    find(CONFIRM_BDAY_LINK).click
    sleep 2
  end

  def click_no_thanks
    all('.button__text-wrapper')[1].click
    sleep 1
  end

  def click_register
    find(REGISTRATION_SUBMIT).click
    sleep 2
  end

  def confirm_register
    visit('https://account.bbc.com/register/thanks?context=homepage&isCasso=false&marketingOptIn=off&nonce=PQx1FEib-uAVLZbh82_gyHH9AnfQvNS9-IEE&ptrt=https%3A%2F%2Fwww.bbc.co.uk%2F&userOrigin=homepage')
  end
end
