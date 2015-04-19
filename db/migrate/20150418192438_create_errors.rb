class CreateErrors < ActiveRecord::Migration
  def change
    create_table :errors do |t|
      t.text :description, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
    add_index :errors, :user_id
  end
end
