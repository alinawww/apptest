class AddValueToRatings < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :value, :string
  end
end
