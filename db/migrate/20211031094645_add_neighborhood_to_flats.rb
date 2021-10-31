class AddNeighborhoodToFlats < ActiveRecord::Migration[6.1]
  def change
    add_reference :flats, :neighborhood
  end
end
