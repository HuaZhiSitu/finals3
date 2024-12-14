class SkinsController < ApplicationController
  def index
    @list_of_skins=Skin.includes(:bids).order(created_at: :desc)
    render template: "skins/index"
  end

  def new
    @skin=Skin.new
  end

  def create
    @skin = Skin.new(skin_params)
    if @skin.save
      redirect_to "/skins", notice: "Skin uploaded successfully!"
    else
      render :new, alert: "Error uploading skin."
    end
  end

  def update
    render template: "skins/newbie"
  end

  def show
    @the_skin = Skin.find_by(id: params[:id])
    if @the_skin.nil?
      redirect_to skins_path, alert: "Skin not found." and return
    end
    render template: "skins/show"
  end

  def update_description
    @the_skin = Skin.find_by(id: params[:id])
    if @the_skin.update(description_params)
      redirect_to skin_path(@the_skin), notice: "Description updated successfully!"
    else
      flash.now[:alert] = "Failed to update the description."
      render :show
    end
  end

  def update_description
    the_id = params[:path_id]
    the_targetskin = Skin.find_by(id: the_id)
  
    if the_targetskin.nil?
      redirect_to skins_path, alert: "Skin not found."
      return
    end
  
    the_targetskin.description = params[:description_value]
  
    if the_targetskin.save
      redirect_to skin_path(the_targetskin), notice: "Description updated successfully!"
    else
      redirect_to skin_path(the_targetskin), alert: the_targetskin.errors.full_messages.to_sentence
    end
  end

  private 
  def skin_params
    params.require(:skin).permit(:name, :description, :image_url, :starting_price)
  end

  def description_params
    params.require(:skin).permit(:description)
  end
end
