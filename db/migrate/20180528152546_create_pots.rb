class CreatePots < ActiveRecord::Migration[5.2]
  def change
    create_table :pots do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.integer :size
      t.date :adoption_date
      t.date :last_watering
      t.date :last_potting
      t.date :last_fertilizing
      t.date :last_cutting
      t.integer :recipient_size
      t.references :user, foreign_key: true
      t.references :plant, foreign_key: true

      t.timestamps
    end
  end
end
