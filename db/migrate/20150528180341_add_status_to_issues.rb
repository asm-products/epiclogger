class AddStatusToIssues < ActiveRecord::Migration
  def change
    change_table(:issues) do |t|
      t.integer :status
    end
  end
end
