class CharactersController < ApplicationController
  before_action :set_character, only: [:edit, :update, :show, :destroy]

  def index
    @characters = Character.all
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      flash[:notice] = "You successfully created a new character"
      redirect_to character_path(@character)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @character.update(character_params)
      flash[:notice] = "You have successfully updated your character"
      redirect_to character_path(@character)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @character.destroy
    flash[:notice] = "Character deleted"
    redirect_to characters_path
  end

  private

  def character_params
    params.require(:character).permit(:name, :avatar)
  end

  def set_character
    @character = Character.find(params[:id])
  end
end
