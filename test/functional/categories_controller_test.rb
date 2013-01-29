require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    sign_in users(:one)
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    sign_in users(:one)
    get :new
    assert_response :success
  end

  test "should create category" do
    sign_in users(:one)
    assert_difference('Category.count') do
      post :create, category: { max_value: @category.max_value, min_value: @category.min_value, name: @category.name }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    sign_in users(:one)
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    sign_in users(:one)
    put :update, id: @category, category: { max_value: @category.max_value, min_value: @category.min_value, name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    sign_in users(:one)
    assert_difference('Category.count', -1) do
    sign_in users(:one)
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
