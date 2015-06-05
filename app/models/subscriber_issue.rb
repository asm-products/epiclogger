class SubscriberIssue < ActiveRecord::Base
  belongs_to :issue
  belongs_to :subscriber

  validates :subscriber, presence: true
  validates :issue, presence: true
end
