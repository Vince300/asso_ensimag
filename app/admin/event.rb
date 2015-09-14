ActiveAdmin.register Event do
  permit_params :name, :start_time, :end_time, :location, :description, :facebook_url, :picture, :asso_id, :published

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

  controller do
    def create
      set_published_date
      super
    end

    def update
      set_published_date
      super
    end

    def set_published_date
      if params[:event]["published(1i)"].blank?
        d = DateTime.now
        params[:event]["published(1i)"] = d.year.to_s
        params[:event]["published(2i)"] = d.month.to_s
        params[:event]["published(3i)"] = d.day.to_s
        params[:event]["published(4i)"] = d.hour.to_s
        params[:event]["published(5i)"] = d.minute.to_s
      end
    end
  end

  form(html: { multipart: true }) do |f|
    f.inputs "Event" do
      f.input :name
      f.input :asso
      f.input :published
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