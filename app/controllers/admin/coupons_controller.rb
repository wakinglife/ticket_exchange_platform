class Admin::CouponsController < Admin::BaseController  
  before_action :set_coupon, only: [:show, :edit, :update, :destroy]

  def index
    @coupons = Coupon.all.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    #set_coupon
  end

  def edit
    #set_coupon
  end

  def update
    if @coupon.update(coupon_params)
      flash[:notice] = "Coupon was successfully updated"
      redirect_to admin_coupon_path(@coupon)
    else
      flash.now[:alert] = "Coupon was failed to update"
      render :edit
    end
  end

  def destroy
    @coupon.destroy
    redirect_to admin_coupons_path
    flash[:alert] = "Coupon was deleted"
  end

  private

  def set_coupon
    @coupon = Coupon.find(params[:id])
  end

  def coupon_params
    params.require(:coupon).permit(:airline, :destination, :coupon_expiry_date, :flight_date_from, :flight_date_to, :tax, :image, :others, :quantity, :departure)
  end

end
