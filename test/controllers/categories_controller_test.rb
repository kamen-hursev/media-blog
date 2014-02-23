require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:sport)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test 'should have table with results' do
    get :index
    assert_response :success
    assert_select 'table tbody' do |elements|
      elements.each do |element|
        assert_select element, 'tr'
      end
    end
  end

  test 'categories with reports should not have delete button' do
    get :index
    Category.all.each do |category|
      assert_select "table tr[data-id=#{category.id}] .btn-destroy",
                    category.reports.size > 0 ? 0 : 1
    end
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post :create, category: { name: 'Test category' }
    end

    assert_redirected_to :categories
  end

  test 'should show category' do
    get :show, id: @category
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @category
    assert_response :success
  end

  test 'should update category' do
    patch :update, id: @category, category: { name: @category.name }
    assert_redirected_to category_path(assigns(:category))
  end

  test 'should destroy category' do
    category = categories(:fun)
    assert_difference('Category.count', -1) do
      delete :destroy, id: category
    end

    assert_redirected_to categories_path
  end
end
