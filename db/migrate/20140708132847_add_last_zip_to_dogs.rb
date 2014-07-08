class AddLastZipToDogs < ActiveRecord::Migration
  def change
    add_column :dogs, :last_zip, :text, null: false
  end
end
