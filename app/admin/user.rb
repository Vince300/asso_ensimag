ActiveAdmin.register User do
  permit_params :username, :email, :description, :order, :site_url, :facebook_url

  index do
    selectable_column
    id_column
    column :username
    column :slug
    column :email
    column :description
    column :order
    column :site_url
    column :facebook_url
  end

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end


end
