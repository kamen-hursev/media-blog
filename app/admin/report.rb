ActiveAdmin.register Report do
  permit_params :title, :slug, :body, :user_id, :category_id

  controller do
    def scoped_collection
      resource_class.includes(:category, :user)
    end
  end

  index do
    selectable_column
    id_column
    column :title
    column :slug
    column 'category', sortable: 'categories.name' do |u|
      u.category.name
    end
    column 'owner', sortable: 'users.email' do |u|
      u.user.email
    end
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs 'Report' do
      f.input :title
      f.input :slug
      f.input :category
      f.input :user, member_label: :email
      f.input :body
    end
    f.actions
  end
end
