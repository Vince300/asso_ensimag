ActiveAdmin.register User do
  permit_params :email, :username, :slug, :description, :order, :site_url, :facebook_url, :color, :picture, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :username
    column :slug
    column :email
    column :order
    column :site_url
    column :facebook_url
    column :color
    actions
  end

  filter :username
  filter :email
  filter :current_sign_in_at

  controller do
    after_create do |user|
      if user.persisted?
        UserCreateMailer.welcome_email(user).deliver
      end
    end

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

    def find_resource
      scoped_collection.where(slug: params[:id]).first!
    end
  end

  form(html: { multipart: true }) do |f|
    if f.object.new_record? then
      f.object.order = (User.maximum(:order) + 1) || 1
      f.object.color = '#CCCCCC'
    end

    f.inputs "Détails de l'association" do
      f.input :username
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :description, as: :ckeditor, input_html: { ckeditor: { 'customConfig' => asset_path('ckeditor/config.js') }}
      f.input :order
      f.input :site_url
      f.input :facebook_url
      f.input :color, as: :string
      f.input :picture, as: :file
    end
    f.actions
  end
end
