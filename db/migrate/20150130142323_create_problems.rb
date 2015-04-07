class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.string :description
      t.string :contributor
      t.string :category
      t.integer :difficulty
      t.string :answer
      t.integer :round_id
      t.integer :num_points
      t.timestamps
    end
  end
end
