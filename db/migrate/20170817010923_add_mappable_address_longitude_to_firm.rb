class AddMappableAddressLongitudeToFirm < ActiveRecord::Migration[5.0]
  def change
    add_column :firms, :mappable_address_longitude, :float
  end
end
