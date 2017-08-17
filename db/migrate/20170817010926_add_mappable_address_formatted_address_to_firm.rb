class AddMappableAddressFormattedAddressToFirm < ActiveRecord::Migration[5.0]
  def change
    add_column :firms, :mappable_address_formatted_address, :string
  end
end
