ActiveAdmin.register Category do
  permit_params :name

  controller do
    def scoped_collection
      resource_class.includes(:reports)
    end
  end

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at
    column 'reports count' do |category|
      category.reports.size
    end
    actions defaults: false do |category|
      links = link_to 'Show', admin_category_path(category), class: 'member_link view_link'
      links += link_to 'Edit', edit_admin_category_path(category), class: 'member_link edit_link'
      if category.reports.size == 0
        links += link_to 'Delete', admin_category_path(category),
                         class: 'member_link delete_link',
                         method: :delete, data: { confirm: 'Are you sure?' }
      end
      links
    end
  end
end
