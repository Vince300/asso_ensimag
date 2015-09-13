ActiveAdmin.register BlogPost do
  permit_params :title, :published, :summary, :body, :author, :picture

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :published
    column :summary
    column :picture
    actions
  end

  filter :title
  filter :author
  filter :summary
  filter :published
  filter :body
  filter :slug

  form(html: { multipart: true }) do |f|
    f.inputs "Article" do
      f.input :title
      f.input :author
      f.input :published
      f.input :summary
      f.input :body, as: :ckeditor, input_html: { ckeditor: { 'customConfig' => asset_path('ckeditor/config.js') }}
      f.input :picture, as: :file
    end
    f.actions
  end
end