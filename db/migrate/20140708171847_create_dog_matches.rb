class CreateDogMatches < ActiveRecord::Migration
  def change
    create_table :dog_matches do |t|
      t.references :dog, index: true
      t.references :user, index: true
      t.boolean :is_favorite
      t.boolean :is_top

      t.timestamps
    end
  end
end
