class AddCategoryRefToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :category, index: true
  end
end
