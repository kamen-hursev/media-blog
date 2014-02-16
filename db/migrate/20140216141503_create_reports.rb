class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps
    end
  end
end
