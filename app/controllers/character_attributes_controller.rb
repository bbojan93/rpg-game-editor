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
    respond_to do |format|
      if @character_attribute.save
        format.js
        format.html { redirect_to character_path(@character_attribute.character_id)}
      else
        format.html {redirect_to character_path(@character_attribute.character_id)}
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @character_attribute.update(attribute_params)
        format.js
        format.html { redirect_to character_path(@character_attribute.character_id)}
      else
        format.html {redirect_to character_path(@character_attribute.character_id)}
      end
    end
  end

  def show
  end

  def destroy

    respond_to do |format|
      if @character_attribute.destroy
        format.js
        format.html { redirect_to character_path(@character_attribute.character_id) }
      end
    end
  end

  private

  def attribute_params
    params.require(:character_attribute).permit(:icon, :attribute_name, :attribute_value, :character_id)
  end

  def set_attribute
    @character_attribute = CharacterAttribute.find(params[:id])
  end

end
