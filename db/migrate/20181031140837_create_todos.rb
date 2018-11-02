class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.date :due_date
      t.boolean :finish
      t.integer :priority

      t.timestamps
    end
  end
end
