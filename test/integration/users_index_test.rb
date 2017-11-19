require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:meumeu)
    @non_admin = users(:ibubu)
  end

  test 'index as admin including pagination and delete links' do
    login_as(@user)
    get users_path
    assert_template('users/index')
    assert_select('div.pagination', count: 2)
    first_page = User.paginate(page: 1)
    first_page.each do |user|
      assert_select('a[href=?]', user_path(user), text: user.name)
      unless (user == @user)
        assert_select('a[href=?]', user_path(user), text: 'delete')
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end

  test 'index as non admin' do
    login_as(@non_admin)
    get users_path
    assert_select('a', text: 'delete', count: 0)
  end
end
