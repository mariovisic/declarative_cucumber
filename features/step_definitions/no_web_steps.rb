Then /^I should be able to login$/ do
  visit new_user_session_path
  fill_in_my_details
  click_button 'Sign in'
  page.should have_content 'Signed in'
end

def fill_in_my_details
  fill_in 'Email', :with => @current_email
  fill_in 'Password', :with => @current_password
end
