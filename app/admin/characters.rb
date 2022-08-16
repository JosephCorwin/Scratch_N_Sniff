ActiveAdmin.register Character do
  permit_params :name, :xp, :rocks, :gems, :hair, :note, :guild_id
end
