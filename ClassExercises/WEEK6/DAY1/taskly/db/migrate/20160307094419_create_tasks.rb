class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :due_date
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
