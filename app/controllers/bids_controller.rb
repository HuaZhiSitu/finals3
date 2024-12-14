class BidsController < ApplicationController
  def new
    @skin = Skin.find_by(id: params[:skin_id])
    if @skin.nil?
      redirect_to skins_path, alert: "Skin not found."
    else
      @bid = Bid.new
    end
  end

  def create
    @bid = Bid.new(bid_params)
    @skin = Skin.find(params[:bid][:skin_id]) # Ensure the skin is fetched

    if @bid.save
      redirect_to skin_path(@bid.skin), notice: "Bid placed successfully!"
    else
      flash.now[:alert] = "Your bid could not be placed. Please correct the errors below."
      render :new
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :user_id, :skin_id)
  end

end
