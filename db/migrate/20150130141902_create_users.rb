class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.integer :age
      t.string :email
      t.string :password_digest
      t.boolean :admin
      
      t.timestamps
    end
  end
end
