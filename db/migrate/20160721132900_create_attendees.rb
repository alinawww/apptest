class CreateAttendees < ActiveRecord::Migration[5.0]
  def change
    create_table :attendees do |t|

      t.timestamps
    end
  end
end
