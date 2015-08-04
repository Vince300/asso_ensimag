class AddColorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :color, :string

    reversible do |dir|
      dir.up do
        User.all.each do |user|
          user.color = "#CCCCCC";
          user.save
        end
      end
    end
  end
end
