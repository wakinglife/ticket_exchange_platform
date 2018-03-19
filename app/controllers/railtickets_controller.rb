class RailticketsController < ApplicationController

  before_action :set_railticket, only: [:show, :edit, :update, :destroy, :favorite, :unfavorite]

    def index
      @railtickets = Railticket.page(params[:page]).per(20)


    end

    def new
    @railtickets = Railticket.new
    end

    def create
      @railtickets = Railticket.new(railticket_params)
      @railtickets.save

      redirect_to railtickets_url
    end

    def show
      #set_ticket

      @comment = Comment.new
    end

    def edit
      #set_ticket
    end

    def update
      if @railticket.update(railticket_params)
        flash[:notice] = "Ticket was successfully updated"
        redirect_to railticket_path(@railticket)
      else
        flash.now[:alert] = "Ticket was failed to update"
        render :edit
      end
    end

    def destroy
      @railticket.destroy
      redirect_to railtickets_path
      flash[:alert] = "Ticket was deleted"
    end

    def favorite

      @railticket.favorites.create!(user: current_user)
      redirect_back(fallback_location: root_path)
    end

   def unfavorite

     favorites = Favorite.where(railticket: @railticket, user: current_user)
     favorites.destroy_all
     redirect_back(fallback_location: root_path)
   end

  private

    def set_railticket
      @railtickets = Railticket.find(params[:id])
    end


    def railticket_params
      params.require(:railticket).permit(:train_no, :train_date, :departur_time, :arrive_time, :departure, :destination, :name, :price, :discount, :image, :others )
    end


end