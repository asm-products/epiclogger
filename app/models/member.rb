class Member < ActiveRecord::Base
  has_many :websites

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
