class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @booking = Booking.find(params[:booking_id])
    @message.booking = @booking

    if @message.save
      # diffenrent formats
      respond_to do |format|
        format.html { redirect_to booking_path(@booking) }
        format.turbo_stream do
          render turbo_stream: turbo_stream.append(:messages, partial: 'messages/message', locals: { message: @message })
        end
      end

    else
      render 'bookings/show', status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
