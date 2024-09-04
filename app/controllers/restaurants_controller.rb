class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @booking = Booking.new # for the form
    @current_user_bookings = @restaurant.bookings.where(user: current_user)
  end
end
