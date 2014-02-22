require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not save category without name' do
    category = Category.new
    assert category.invalid?, 'category without a name is valid'
    assert category.errors[:name].any?
  end

  test 'should not save two categories with the same name' do
    category = Category.new(name: 'Sport')
    assert category.invalid?, 'category with existing name is valid'
    assert category.errors[:name].any?
  end

end
