class AddIndexToPicture < ActiveRecord::Migration
  def change
    add_index :pictures, :report_id
  end
end
