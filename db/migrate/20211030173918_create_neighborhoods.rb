class CreateNeighborhoods < ActiveRecord::Migration[6.1]
  def change
    create_table :neighborhoods do |t|
      t.string :name
      t.string :coordinate_range

      t.timestamps
    end
  end
end
