require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, 'Ruby on rails tutorial Sample App'
    assert_equal full_title('Help'), 'Help | Ruby on rails tutorial Sample App'
  end
end
