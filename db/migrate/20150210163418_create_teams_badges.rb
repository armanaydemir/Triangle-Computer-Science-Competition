class CreateTeamsBadges < ActiveRecord::Migration
  def change
    create_table :teams_badges do |t|
      t.belongs_to :team , index: true
      t.belongs_to :badge , index: true
      t.references :team, index: true
      t.references :badge, index: true

      t.timestamps null: false
    end
  end
end
