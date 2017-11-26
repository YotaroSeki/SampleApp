require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = users(:meumeu)
    @micropost = @user.microposts.build(content: 'めう、めうめうめう！')
  end

  test 'should be valid' do
    assert(@micropost.valid?)
  end

  test 'user id should be present' do
    @micropost.user_id = nil
    assert_not(@micropost.valid?)
  end

  test 'content should be present' do
    assert(@micropost.valid?)
    @micropost.content = ' '
    assert_not(@micropost.valid?)
  end

  test 'content should be at most 140 chars' do
    @micropost.content = 'a' * 141
    assert_not(@micropost.valid?)
  end

  test 'order should be most recent first' do
    assert_equal(microposts(:nullnull), Micropost.first)
  end
end
