class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :members, :email, unique: true
  end
end
