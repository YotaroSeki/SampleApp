require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert(true)
  # end

  def setup
    @user = User.new(name: 'Meu Meu', email: 'meumeu@example.com', password: 'foobar', password_confirmation: 'foobar')
  end

  test 'should be vaild' do
    assert(@user.valid?)
  end

  test 'name should be present' do
    @user.name = ' '
    assert_not(@user.valid?)
  end

  test 'email should be present' do
    @user.email = '     '
    assert_not(@user.valid?)
  end

  test 'name should not be too long' do
    @user.name = 'a' * 51
    assert_not(@user.valid?)
  end

  test 'email should not be too long' do
    @user.email = 'a' * 244 + '@example.com'
    assert_not(@user.valid?)
  end

  test 'email validation should accept valid addresses' do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |address|
      @user.email = address
      assert(@user.valid?, "#{address.inspect} should be valid")
    end
  end

  test 'email validation should reject invalid adresses' do
    invalid_adresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_adresses.each do |invalid_adress|
      @user.email = invalid_adress
      assert_not(@user.valid?, "#{invalid_adress.inspect} should be invalid")
    end
  end

  test 'email should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email =@user.email.upcase
    @user.save
    assert_not(duplicate_user.valid?)
  end

  test 'email addresses should be saved as lower-case' do
    mixed_case_address = 'MeumeU@example.com'
    @user.email = mixed_case_address
    @user.save
    assert_equal(mixed_case_address.downcase, @user.reload.email)
  end

  test 'password should not be blank' do
    @user.password = @user.password_confirmation = ' ' * 6
    assert_not(@user.valid?)
  end

  test 'password should have a min length' do
    @user.password = @user.password_confirmation = 'a' * 5
    assert_not(@user.valid?)
  end

  test 'user#authenticated? should return false if a user has nil digest' do
    assert_not(@user.authenticated?(''))
  end
end
