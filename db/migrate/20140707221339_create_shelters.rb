class CreateShelters < ActiveRecord::Migration
  def change
    create_table :shelters do |t|
      t.text :petfinder_id, null: false
      t.text :name, :phone, :email
      t.text :url, null: false

      t.timestamps
    end
  end
end
