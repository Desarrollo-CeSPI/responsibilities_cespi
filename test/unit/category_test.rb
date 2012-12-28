require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "present attributes" do 
    cateogry = Category.new

    assert cateogry.invalid?
    assert_equal 3, cateogry.errors.size
    assert_present cateogry.errors[:name]
    assert_present cateogry.errors[:min_value]
    assert_present cateogry.errors[:max_value]
  end

end
