class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.float :hours_spent, precision: 10, scale: 2
      t.boolean :rounding, default: false
      t.string :rounding_direction, default: "up"
      t.integer :rounding_increment, default: 15
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
