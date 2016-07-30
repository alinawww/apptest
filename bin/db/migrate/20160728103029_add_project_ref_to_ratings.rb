class AddProjectRefToRatings < ActiveRecord::Migration[5.0]
  def change
    add_reference :ratings, :project, foreign_key: true
  end
end
