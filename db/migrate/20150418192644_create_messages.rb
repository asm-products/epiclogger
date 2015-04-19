class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id, null:false
      t.text :content, null: false
      t.integer :error_id, null: false

      t.timestamps null: false
    end
    add_index :messages, :user_id
    add_index :messages, :error_id
  end
end
