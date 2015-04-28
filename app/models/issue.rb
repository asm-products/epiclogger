class Issue < ActiveRecord::Base
  has_many :messages
  has_and_belongs_to_many :users, join_table: "user_issues"


  validates :description, :presence => true, length: {minimum: 10}
end
