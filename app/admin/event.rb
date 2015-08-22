ActiveAdmin.register Event do
  permit_params :name, :start_time, :end_time, :location, :description, :facebook_url, :asso

  index do
    selectable_column
    id_column
    column :name
    column :asso
    column :start_time
    column :location
    actions
  end

  filter :name
  filter :asso
  filter :start_time
  filter :end_time
  filter :location
  filter :summary

  form do |f|
    f.inputs "Event" do
      f.input :name
      f.input :asso
      f.input :start_time
      f.input :end_time
      f.input :location
      f.input :facebook_url
      f.input :description, as: :ckeditor, input_html: { ckeditor: { 'customConfig' => asset_path('ckeditor/config.js') }}
    end
    f.actions
  end
end