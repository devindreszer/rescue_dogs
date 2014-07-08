class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.text :petfinder_id, null: false
      t.text :name, :image, :size, :gender, :age, :description
      t.text :url, null: false
      t.references :shelter, index: true

      t.timestamps
    end
  end
end
