class AddIntvalueToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :value, :integer
  end
end
