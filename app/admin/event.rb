ActiveAdmin.register Event do
  permit_params :name, :start_time, :end_time, :location, :description, :facebook_url, :picture, :asso_id

  index do
    selectable_column
    id_column
    column :name
    column :asso
    column :start_time
    column :location
    column :picture
    actions
  end

  filter :name
  filter :asso
  filter :start_time
  filter :end_time
  filter :location
  filter :summary

  form(html: { multipart: true }) do |f|
    f.inputs "Event" do
      f.input :name
      f.input :asso
      f.input :start_time
      f.input :end_time
      f.input :location
      f.input :facebook_url
      f.input :description, as: :ckeditor, input_html: { ckeditor: { 'customConfig' => asset_path('ckeditor/config.js') }}
      f.input :picture, as: :file
    end
    f.actions
  end
end