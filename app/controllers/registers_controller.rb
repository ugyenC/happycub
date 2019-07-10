# frozen_string_literal: true

class RegistersController < BaseController

  def index
    @guest = Guest.all
    @register = Register.all
    @event = Event.all
  end

  def new
    @event = Event.new
    @register = Register.new(user_id: current_user.id, event_id: params[:event_id])
    @register.guests.build
  end

  def show; end

  def create
    @register = Register.new(register_params)
    if @register.save
      redirect_to event_path(@register[:event_id])
    end

  end

  def destroy
    Register.where(event_id: params[:event_id], user_id: current_user.id).first.destroy
    redirect_to event_path(params[:event_id])
  end



  private

  def register_params
    params.require(:register).permit(
      :user_id,
      :event_id,
      guests_attributes: %i[id fname lname age]
    )
  end

  def guest_params
    params.permit(
      :register_id,
      :fname,
      :lname,
      :age
    )
  end

end
