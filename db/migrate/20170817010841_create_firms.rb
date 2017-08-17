class CreateFirms < ActiveRecord::Migration
  def change
    create_table :firms do |t|
      t.string :name
      t.string :mappable_address
      t.string :address
      t.string :category
      t.string :city
      t.string :state

      t.timestamps

    end
  end
end
