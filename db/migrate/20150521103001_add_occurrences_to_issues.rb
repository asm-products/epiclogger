class AddOccurrencesToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :occurrences, :integer
    add_column :issues, :last_occurrence, :datetime
  end
end
