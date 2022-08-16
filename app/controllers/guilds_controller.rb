class GuildsController < InheritedResources::Base

  private

    def guild_params
      params.require(:guild).permit(:name)
    end

end
