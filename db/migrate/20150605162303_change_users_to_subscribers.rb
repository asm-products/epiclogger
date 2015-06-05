class ChangeUsersToSubscribers < ActiveRecord::Migration
  def change
    rename_table :users, :subscribers
    rename_table :user_issues, :subscriber_issues

    rename_column :subscriber_issues, :user_id, :subscriber_id
  end
end
