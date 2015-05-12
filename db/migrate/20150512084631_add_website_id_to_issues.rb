class AddWebsiteIdToIssues < ActiveRecord::Migration
  def change
    add_reference :issues, :website, index: true, foreign_key: true
  end
end
