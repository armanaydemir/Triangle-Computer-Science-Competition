class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points
      t.string :school
      t.string :password_digest
      t.timestamps
    end
  end
end
