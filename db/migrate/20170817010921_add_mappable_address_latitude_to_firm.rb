class AddMappableAddressLatitudeToFirm < ActiveRecord::Migration[5.0]
  def change
    add_column :firms, :mappable_address_latitude, :float
  end
end
