if User.count == 0
  email = 'user@example.com'
  password = 'password'
  User.create!(:email => email, :password => password)

  puts "==============\n"
  puts "User created with the following details:"
  puts "Email:    #{email}"
  puts "Password: #{password}"
end
