Then /^I should be able to login$/ do
  visit new_user_session_path
  Then %{I fill in my details}
  click_button 'Sign in'
  page.should have_content 'Signed in'
end

Then /^I fill in my details$/ do
  fill_in 'Email', :with => @current_email
  fill_in 'Password', :with => @current_password
end
