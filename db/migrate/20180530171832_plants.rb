class Plants < ActiveRecord::Migration[5.2]
  def change
    change_table :plants do |t|
      t.rename :fertilizer_type,  :fertilizing_type
      t.rename :fertilizer_frequency, :fertilizing_frequency
      t.rename :fertilizer_quantity, :fertilizing_quantity
    end
  end
end
