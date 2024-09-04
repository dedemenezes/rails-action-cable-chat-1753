class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @message = Message.new # for the form
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @booking.restaurant = @restaurant

    if @booking.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show', status: :unprocessable_entity
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
