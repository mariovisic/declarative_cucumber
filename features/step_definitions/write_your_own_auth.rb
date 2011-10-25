Given /^I have a valid account$/ do
  @current_email = 'my@email.com'
  @current_password = 'candles'
  @current_user = FactoryGirl.create(:user, :email => @current_email, :password => @current_password)
end

When /^I fill in my user details$/ do
  Then %{I fill in "Email" with "#{@current_email}"}
  Then %{I fill in "Password" with "#{@current_password}"}
end
