class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name
      t.date :start
      t.date :end
      t.integer :progress

      t.timestamps
    end
  end
end
