ActiveAdmin.register Partner do
  permit_params :name, :site_url, :description, :picture, :asso_id

  index do
    selectable_column
    id_column
    column :name
    column :site_url
    column :description
    column :asso
    actions
  end

  filter :name
  filter :site_url
  filter :description
  filter :asso

  form(html: { multipart: true }) do |f|
    f.inputs "Partner" do
      f.input :name
      f.input :site_url
      f.input :description
      f.input :picture, as: :file
      f.input :asso
    end
    f.actions
  end
end