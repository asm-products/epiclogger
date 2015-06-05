class Website < ActiveRecord::Base
  belongs_to :member
  has_many :subscribers
  has_many :issues

  validates :title, :presence => true
  validates :domain, :presence => true
  validates :member, :presence => true
end
