require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  test "should create category when all required fields are filled" do 
    category = get_new_category
    assert category.save
  end

  test "should not create category when all fields are nil" do
    category = Category.new
    assert category.invalid?
    assert_equal 3, category.errors.size
    assert_present category.errors[:name]
    assert_present category.errors[:min_value]
    assert_present category.errors[:max_value]
    refute category.save, "Tried to save category being all fields nil"
  end

  test "should not create category when name is nil" do
    category = get_new_category
    field_not_nil_test(:name=, category)
  end

  private
  def get_new_category
    category = Category.new
    category.name = 'Un nombre de categoria'
    category.min_value = 20
    category.max_value = 40

    category
  end

  def field_not_nil_test(field, category)
    category.send field, nil
    refute category.save
  end
end
