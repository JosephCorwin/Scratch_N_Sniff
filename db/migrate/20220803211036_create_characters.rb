class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :xp
      t.integer :rocks
      t.integer :gems
      t.integer :hair

      t.timestamps
    end
  end
end
