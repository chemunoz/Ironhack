class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.text :url_original
      t.text :url_shorted

      t.timestamps null: false
    end
  end
end
