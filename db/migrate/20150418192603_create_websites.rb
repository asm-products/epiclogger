class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :title, null: false
      t.string :domain, null: false
      t.integer :member_id, null: false

      t.timestamps null: false
    end
    add_index :websites, :member_id
  end
end
