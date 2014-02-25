require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not allow category without name' do
    category = Category.new
    assert category.invalid?, 'category without a name is valid'
    assert category.errors[:name].any?
  end

  test 'should not allow two categories with the same name' do
    category = Category.new(name: categories(:sport).name)
    assert category.invalid?, 'category with existing name is valid'
    assert category.errors[:name].any?
  end

  test 'should not delete category with reports in it' do
    category = categories(:sport)
    assert_raises ActiveRecord::DeleteRestrictionError do
      assert !category.destroy, 'category with reports in it is destroyed'
    end
  end
end
