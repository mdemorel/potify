class AddPlantUrlToPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :plants, :plant_url, :string
  end
end
