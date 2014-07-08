class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :street_line1, :street_line2, :city, :state, :zip
      t.belongs_to :shelter, index: true

      t.timestamps
    end
  end
end
