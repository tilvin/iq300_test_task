class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
