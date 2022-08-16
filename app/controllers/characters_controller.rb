class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: %i[ index show ]

  # GET /characters or /characters.json
  def index
    @characters = Character.all.order(:name)
  end

  # GET /characters/1 or /characters/1.json
  def show
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), notice: "Character was successfully created." }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(crunched_params)
        format.html { redirect_to character_url(@character), notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def character_params
      params.require(:character).permit(:name, :xp, :rocks, :gems, :hair)
    end

    def crunch_params(params)
      params.each_pair do |k, v|
        next unless %i[rocks gems hair].include? k

        case v[0]
        when '+'
          params[k] = @character.send(k) + v[1..].to_i
        when '-'
          params[k] = @character.send(k) + v[1..].to_i
        else
          next
        end
      end
    end

    def crunched_params
      crunch_params(character_params)
    end 
end
