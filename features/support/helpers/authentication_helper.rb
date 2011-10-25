module AuthenticationHelper
  def fill_in_my_details
    fill_in 'Email', :with => @current_email
    fill_in 'Password', :with => @current_password
  end
end

World(AuthenticationHelper)
