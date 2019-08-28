class CreateTodos < ActiveRecord::Migration[6.0]
  def change
    create_table :todos do |t|
      t.string :name, :null => false
      t.text :note
      t.boolean :completed, :default => false
      t.references :project, null: false, foreign_key: true
      t.timestamps
    end
  end
end
