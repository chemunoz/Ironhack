class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.references :tournament, index:true
      t.references :player, index:true
      t.timestamps null: false
    end
  end
end
