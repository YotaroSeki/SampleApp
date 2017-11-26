require 'test_helper'

class MicropostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:meumeu)
  end

  test 'microposts interface' do
    login_as(@user)
    get root_path
    assert_select('div.pagination')
    assert_select('input[type="file"]')
    # invalid micropost
    assert_no_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: '' } }
    end
    assert_select('div#error_explanation')
    # valid micropost
    content = 'popopo'
    picture = fixture_file_upload('test/fixtures/hinabita.jpg', 'image/jpg')
    assert_difference 'Micropost.count' do
      post microposts_path, params: { micropost: { content: content, picture: picture } }
    end
    assert(assigns(:micropost).picture?)
    assert_redirected_to(root_url)
    follow_redirect!
    assert_match(content, response.body)
    # delete
    assert_select('a', text: 'delete')
    first_micropost = @user.microposts.paginate(page: 1).first
    assert_difference 'Micropost.count', -1 do
      delete micropost_path(first_micropost)
    end
    get user_path(users(:sakiki))
    assert_select('a', text: 'delete', count: 0)
  end
end
