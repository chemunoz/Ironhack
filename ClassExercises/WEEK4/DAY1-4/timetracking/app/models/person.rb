class Person < ActiveRecord::Base
  has_many :projects, through: :participations
  has_many :participations
end
