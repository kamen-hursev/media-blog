ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin

  controller do
    def update_resource(object, attributes)
      if attributes.first[:password].present?
        update_method = :update_attributes
      else
        update_method =  :update_without_password
      end
      object.send(update_method, *attributes)
    end
  end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :admin
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs 'User' do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end
    f.actions
  end
end
