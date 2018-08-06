require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @user2 = users(:frank)
    @all_users = []
    @all_users << users(:michael)
    @all_users << users(:frank)
  end

  test "login with invalid information" do
    get login_path
     assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get root_path
    assert_select "a[href=?]", new_user_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    get user_path(@user)

    assert_select "h3", "#{@user.first_name} #{@user.last_name}"
    assert_select "p", @user.email
  end

  test "The club list users" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get "/the-private-club"
    @all_users.each do |user|
    assert_select "p", "#{user.first_name} #{user.last_name}"
    assert_select "p", "#{user.email}"
    end
  end

end
