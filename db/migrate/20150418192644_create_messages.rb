class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.integer :issue_id, null: false

      t.timestamps null: false
    end
    add_index :messages, :issue_id
  end
end
