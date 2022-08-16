class RemoveNoteFromCharacter < ActiveRecord::Migration[7.0]
  def change
    remove_column :characters, :note, :text
  end
end
