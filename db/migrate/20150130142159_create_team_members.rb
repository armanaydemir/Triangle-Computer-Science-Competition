class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.boolean :leader
      t.belongs_to :team , index: true
      t.belongs_to :user , index: true
      t.references :team, index: true
      t.references :user, index: true
      t.timestamps
    end
  end
end
