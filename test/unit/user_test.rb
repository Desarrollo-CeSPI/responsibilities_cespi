require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "required attributes should be present" do 
    user = User.new

    assert user.invalid?
    
    assert_equal 5, user.errors.size
    assert_present user.errors[:first_name]
    assert_present user.errors[:last_name]
    assert_present user.errors[:user_name]
    assert_present user.errors[:email]
    assert_present user.errors[:password]
    refute user.save
  end

  test "unique attributes" do 
    user            = User.new

    # present attributes
    user.first_name = "first_name"
    user.last_name  = "last_name"
    user.password   = "123456"
    user.password_confirmation = "123456"

    # unique attributes
    user.user_name  = users(:one).user_name
    user.email      = users(:one).email

    assert user.invalid?
    assert_equal 1, user.errors.size
    # assert_present user.errors[:user_name]
    assert_present user.errors[:email]
  end

end
