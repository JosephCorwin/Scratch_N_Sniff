class NotesController < InheritedResources::Base

  private

    def note_params
      params.require(:note).permit(:body, :character_id)
    end

end
