require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def setup
      @user = users(:frank)
    end



  test "should get new" do
    get login_path
    assert_response :success
  end



  test "Homepage connecté : lien page club et logout, pas de login et de nouvel utilisateur" do
   post "/users", params: { user: { first_name: 'test', last_name: 'test', email: 'test@test.com', password: 'password', password_confirmation: 'password' } }
   delete "/logout"
   post "/login", params: { session: { first_name: "test", last_name: "test", email: "test@test.com", password: "password", password_confirmation: "password" } }
   get root_path
   assert_select("a[href=?]", "/logout")
   assert_select("a[href=?]", "/the-private-club")
   assert_no_match("a[href=?]", "/login")
   assert_no_match("a[href=?]", "/users/new")

  #test "Homepage connecté : lien page club et logout, pas de login et de nouvel utilisateur" do
  #  get login_path
  #  post login_path, params: { session: { email: @user.email,
  #                                        password: @user.password_digest } }
  #  assert_template(user_path(@user))
  #  get root_path
  #  assert_select("link_to", "/")
  #  assert_select("link_to", the_private_club_path)
  #  assert_select("link_to", logout_path)
  #  assert_no_match("a[href=?]", login_path)
  #  assert_no_match("a[href=?]", new_user_path)


  end

  test "Création d'utilisateur" do
    post "/users", params: { user: { first_name: "test2", last_name: "test2", email: "test2@mail.com", password: "password", password_confirmation: "password" } }
    get "/"
    assert_select("a[href=?]", "/logout")
    assert_select("a[href=?]", "/the-private-club")
    assert_no_match("a[href=?]", "/login")
    assert_no_match("a[href=?]", "/users/new")
  end
end
