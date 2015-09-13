class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :site_url
      t.text :description
      t.string :picture
      t.references :asso, index: true

      t.timestamps
    end
  end
end
