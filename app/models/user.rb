class User < ActiveRecord::Base
  belongs_to :website
  has_many :error_reports, :foreign_key => 'user_id', :class_name => "Error"

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :website, :presence => true
end
