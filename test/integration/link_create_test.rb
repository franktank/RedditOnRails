require 'test_helper'

class LinkCreateTest < ActionDispatch::IntegrationTest
  test "the world is round" do
    assert true
  end

  test "logged in user submits valid links" do
    user = User.create(:email => "#{Time.now.to_f}@example.com", :password => "password")
    visit new_user_session_path
    assert_equal new_user_session_path, current_path

    fill_in 'user_email', :with => user.email
    fill_in 'user_password', :with => 'password'

    click_button 'Sign in'
    refute_equal '/users/sign_in', current_path

    save_and_open_page
  end
end
