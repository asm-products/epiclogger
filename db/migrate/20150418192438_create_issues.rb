class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
