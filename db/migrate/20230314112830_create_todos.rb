class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.string :name, null: false
      t.date :start, null: false
      t.date :end, null: false
      t.integer :progress, null: false, default: 0

      t.timestamps
    end
  end
end
