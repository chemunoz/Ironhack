class Player < ActiveRecord::Base
  has_many :tournaments, through: :registrations
  has_many :registrations
end
