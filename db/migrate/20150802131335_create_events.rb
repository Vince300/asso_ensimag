class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :slug
      t.datetime :start_time
      t.datetime :end_time
      t.string :location
      t.text :description
      t.string :facebook_url
      t.references :asso, index: true

      t.timestamps
    end
  end
end
