class AddPageTitleToIssues < ActiveRecord::Migration
  def change
    add_column :issues, :page_title, :string
  end
end
