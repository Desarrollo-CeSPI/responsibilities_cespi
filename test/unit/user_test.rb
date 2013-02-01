require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should create user when all required fields are filled" do 
    user = get_new_user
    assert user.save
  end

  test "should not create user when all fields are nil" do
    user = User.new

    assert user.invalid?
    assert_equal 5, user.errors.size
    assert_present user.errors[:first_name]
    assert_present user.errors[:last_name]
    assert_present user.errors[:user_name]
    assert_present user.errors[:email]
    assert_present user.errors[:password]
    refute user.save, "Tried to save user being all fields nil"
  end

  test "should not create user when username is nil" do
    user = get_new_user
    field_not_nil_test(:user_name=, user)
  end

  test "should not create user when first name is nil" do
    user = get_new_user
    field_not_nil_test(:first_name=, user)
  end

  test "should not create user when last_name is nil" do
    user = get_new_user
    field_not_nil_test(:last_name=, user)
  end

    test "should not create user when email is nil" do
    user = get_new_user
    field_not_nil_test(:email=, user)
  end

  test "should not create user when password is nil" do
    user = get_new_user
    field_not_nil_test(:password=, user)
  end

  test "unique attributes" do 
    user = get_new_user

    #attributes that should be unique
    user.user_name = users(:one).user_name
    user.email = users(:one).email

    assert user.invalid?
    assert_equal 2, user.errors.size
    assert_present user.errors[:user_name]
    assert_present user.errors[:email]
  end

  private
  def get_new_user
    user = User.new
    user.first_name = 'Prueba'
    user.last_name = 'Prueba'
    user.email = 'unemail@email.com.ar'
    user.password = '65699gitdj!'
    user.user_name = 'prueba'

    user
  end

  def field_not_nil_test(field, user)
    user.send field, nil
    refute user.save
  end

end
