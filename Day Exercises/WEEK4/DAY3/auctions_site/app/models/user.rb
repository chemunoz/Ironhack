class User < ActiveRecord::Base
  has_many :products

  validates :email, presence: true
  validates :email, uniqueness: true

end
