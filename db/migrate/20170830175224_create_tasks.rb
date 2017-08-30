class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :list_id
      t.boolean :completed

      t.timestamps
    end
  end
end
