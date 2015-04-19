class Message < ActiveRecord::Base
  belongs_to :error

  delegate :user, to: :error

  validates :content, presence: true, length:{ minimum: 10}
  validates :error, :presence => true


end
