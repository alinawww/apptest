class CreateRatedProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :rated_projects do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
