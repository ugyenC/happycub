# frozen_string_literal: true

class BookingsController < BaseController

  def index
    @guest = Guest.all
    @booking = Booking.all
    @event = Event.all
  end

  def new
    @event = Event.new
    @booking = Booking.new(user_id: current_user.id, event_id: params[:event_id])
    @booking.guests.build
  end

  def show; end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to event_path(@booking[:event_id])
    end

  end

  def destroy
    Booking.where(event_id: params[:event_id], user_id: current_user.id).first.destroy
    redirect_to event_path(params[:event_id])
  end



  private

  def booking_params
    params.require(:booking).permit(
      :user_id,
      :event_id,
      guests_attributes: %i[id fname lname age]
    )
  end

  def guest_params
    params.permit(
      :booking_id,
      :fname,
      :lname,
      :age
    )
  end

end
