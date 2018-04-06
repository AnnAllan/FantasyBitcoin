class TradesController < ApplicationController
  def index
    @trades = Trade.all
  end

  def show
    @trade = Trade.find(params[:id])
  end

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(safe_params)
    if @trade.save
      flash[:info] = "Your trade has been saved."
      redirect_to :index
    else
      render 'new'
    end
  end

  def edit
    @trade = Trade.find(params[:id])
  end

  def update
    @trade = Trade.find(params[:id])
    if @trade.update_attributes(safe_params)
      flash[:info] = "Your trade has been updated"
      redirect_to @trade
    else
      render "edit"
    end
  end

  def destroy
    Trade.find(params[:id]).destroy
    flash[:info] = "Your trade has been deleted"
    redirect_to :index
  end

  private

  def safe_params
    params.require(:trade).permit(:user, :user_id, :date, :exchange, :fsym, :fquantity, :tsym, :tquantity)
  end
end
