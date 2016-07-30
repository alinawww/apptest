class RemoveValueFromProject < ActiveRecord::Migration[5.0]
  def change
    remove_column :ratings, :value 
  end
end
