class AddNoteToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_column :characters, :note, :text
  end
end
