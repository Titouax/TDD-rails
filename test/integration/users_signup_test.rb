require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get  '/users/new'
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",
                                         last_name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
      assert_template 'users/new'

  end

  test "valid signup information" do
   get '/users/new'
   assert_difference 'User.count', 1 do
     post users_path, params: { user: { first_name:  "Example User",
                                        last_name: "Richard",
                                        email: "user@example.com",
                                        password:              "password",
                                        password_confirmation: "password" } }
   end
   follow_redirect!
   assert_template 'users/show'
end

end
