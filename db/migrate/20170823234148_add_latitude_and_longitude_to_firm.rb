class AddLatitudeAndLongitudeToFirm < ActiveRecord::Migration[5.0]
  def change
    add_column :firms, :latitude, :float
    add_column :firms, :longitude, :float
  end
end
