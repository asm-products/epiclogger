class UserIssue < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user

  validates :user, presence: true
  validates :issue, presence: true
end
