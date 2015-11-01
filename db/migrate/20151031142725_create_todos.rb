class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.text :text
      t.boolean :isCompleted
      t.references :project, index: true

      t.timestamps
    end
  end
end
