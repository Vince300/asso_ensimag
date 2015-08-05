ActiveAdmin.register BlogPost do
  permit_params :title, :published, :summary, :body, :author

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :published
    column :summary
    actions
  end

  filter :title
  filter :author
  filter :summary
  filter :published
  filter :body
  filter :slug

  form do |f|
    f.inputs "Article" do
      f.input :title
      f.input :author
      f.input :published
      f.input :summary
      f.input :body
    end
    f.actions
  end
end