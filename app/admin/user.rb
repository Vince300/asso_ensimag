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

  filter :username
  filter :email
  filter :current_sign_in_at

  controller do
    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  form do |f|
    f.inputs "Détails de l'association" do
      f.input :username
      f.input :email
      f.input :description
      f.input :order
      f.input :site_url
      f.input :facebook_url
    end
    f.actions
  end
end
