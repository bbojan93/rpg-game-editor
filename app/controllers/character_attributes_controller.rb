class CharacterAttributesController < ApplicationController
  before_action :set_attribute, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!

  def index
    @character_attributes = CharacterAttribute.all
  end

  def new
    @character_attribute = CharacterAttribute.new
  end

  def create
    @character_attribute = CharacterAttribute.new(attribute_params)
    if @character_attribute.save
      flash[:notice] = "You added a new character attribute"
      redirect_to character_path(@character_attribute.character_id)
    else
      redirect_to character_path(@character_attribute.character_id)
    end
  end

  def edit

  end

  def update
    if @character_attribute.update(attribute_params)
      flash[:notice] = "Character attribute updated"
      redirect_to character_path(@character_attribute.character_id)
    else
      redirect_to character_path(@character_attribute.character_id)
    end
  end

  def show
  end

  def destroy
    @character_attribute.destroy
    flash[:notice] = "Attribute deleted"
    redirect_to character_path(@character_attribute.character_id)
  end

  private

  def attribute_params
    params.require(:character_attribute).permit(:icon, :attribute_name, :attribute_value, :character_id)
  end

  def set_attribute
    @character_attribute = CharacterAttribute.find(params[:id])
  end

end
