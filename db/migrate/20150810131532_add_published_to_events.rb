class AddPublishedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :published, :datetime

    reversible do |dir|
      dir.up do
        Event.find_each do |event|
          event.published = event.created_at
          event.save
        end
      end

      dir.down do
      end
    end
  end
end
