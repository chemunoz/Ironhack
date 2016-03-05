class Concert < ActiveRecord::Base
  has_many :comments
  belongs_to :city

  validates :artist, :venue, :city, :date, :price, :description, presence: true

  def self.concerts_today
    Concert.where('date = ?', Date.today)
  end

  def self.concerts_to_come
    from=Date.tomorrow
    to=from.end_of_month
    Concert.where('date BETWEEN ? AND ?',from,to)
  end

  def self.search_concert_price(price)
    Concert.where('price <= ?', price.to_i).where('date > ?', Date.today)
  end

  def self.popular_concerts
    Comment.group(:concert_id).count.sort_by{|k,v| v}.reverse[0..9]
  end
end
