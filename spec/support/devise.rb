RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
end

def valid_attributes(attrs = {})
  { :email => 'test@example.com',
    :password => '12345678',
    :password_confirmation => '12345678' }.update(attrs)
end

def create_user(attrs = {})
  User.create!(valid_attributes(attrs))
end

def logout_user(user = @current_user)
  Capybara.reset_sessions!
  visit destroy_user_session_url
end

def sign_in_as_user(attrs = {})
  user = create_user(attrs)

  visit new_user_session_path

  fill_in 'user_email', :with => 'test@example.com'
  fill_in 'user_password', :with => '12345678'
  click_button 'Log in'
end
