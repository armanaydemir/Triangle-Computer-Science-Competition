class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.string :description
      t.string :contributor
      t.integer :difficulty
      t.integer :num_points
      t.string :category
      t.string :answer
      t.belongs_to :round , index: true
      t.timestamps
    end
  end
end
