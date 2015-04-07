class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :number
      t.integer :year
      t.timestamps
    end
  end
end
