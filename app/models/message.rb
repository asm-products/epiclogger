class Message < ActiveRecord::Base
  belongs_to :issue

  delegate :subscriber, to: :issue

  validates :content, presence: true, length:{ minimum: 10}
  validates :issue, :presence => true


end
