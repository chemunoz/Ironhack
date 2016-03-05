class ChangeTypeDataCityInConcert < ActiveRecord::Migration
  def change
    change_column :concerts, :city, :integer
  end
end
