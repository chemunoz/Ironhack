class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.references :project, index:true
      t.references :person, index:true
      t.timestamps null: false
    end
  end
end
