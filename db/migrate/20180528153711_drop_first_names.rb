class DropFirstNames < ActiveRecord::Migration[5.2]
  def change
    drop_table :first_names
  end
end
