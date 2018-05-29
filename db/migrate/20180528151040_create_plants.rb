class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :watering_frequency
      t.integer :watering_quantity
      t.integer :potting_frequency
      t.integer :fertilizer_quantity
      t.integer :fertilizer_frequency
      t.string :fertilizer_type
      t.integer :exposition
      t.integer :cutting_frequency
      t.integer :temperature
      t.string :photo

      t.timestamps
    end
  end
end
