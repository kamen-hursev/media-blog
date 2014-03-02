class AddUserToReports < ActiveRecord::Migration
  def change
    add_reference :reports, :user, index: true

    reversible do |dir|
      dir.up do
        user = User.first
        if !user
          user = User.create(email: 'test@test.com', password: 1234)
        end
        Report.update_all(user_id: user.id)
        change_column :reports, :user_id, :integer, null: false
      end
    end
  end
end
