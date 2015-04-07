class CreateTeamsQuestions < ActiveRecord::Migration
  def change
    create_table :teams_questions do |t|
      t.belongs_to :team , index: true
      t.belongs_to :question , index: true
      t.references :team, index: true
      t.references :question, index: true
      t.integer :attempts
      t.boolean :correct
      t.timestamps
    end
  end
end
