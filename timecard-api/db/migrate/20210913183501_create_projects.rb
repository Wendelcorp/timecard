class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client
      t.float :hourly_rate, precision: 10, scale: 2
      t.string :hourly_rate_currency

      t.timestamps
    end
  end
end
