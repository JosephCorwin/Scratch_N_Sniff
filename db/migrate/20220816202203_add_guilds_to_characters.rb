class AddGuildsToCharacters < ActiveRecord::Migration[7.0]
  def change
    add_reference :characters, :guild, null: false, foreign_key: true
  end
end
