require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  def setup
    @favorite = Favorite.new(user_id: users(:meumeu).id, micropost_id: microposts(:ants).id)
  end

  test 'should be valid' do
    assert(@favorite.valid?)
  end

  test 'should require user_id' do
    @favorite.user_id = nil
    assert_not(@favorite.valid?)
  end

  test 'should require micropost_id' do
    @favorite.micropost_id = nil
    assert_not(@favorite.valid?)
  end
end
