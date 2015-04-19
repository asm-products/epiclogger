class Error < ActiveRecord::Base
  belongs_to :user
  delegate :website, :to => :user, allow_nil: false


  validates :description, :presence => true, length: {minimum: 10}
  validates :user, :presence => true
end
