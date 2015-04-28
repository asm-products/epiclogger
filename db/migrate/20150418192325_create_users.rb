class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, unique: true, null: false
      t.integer :website_id

      t.timestamps null: false
    end
      
    add_index :users, :email, unique: true
  end
end
