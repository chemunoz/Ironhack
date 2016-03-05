class DeleteConcertidFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :concert_id
  end
end
