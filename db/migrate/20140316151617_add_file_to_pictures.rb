class AddFileToPictures < ActiveRecord::Migration
  def change
    add_attachment :pictures, :file
  end
end
