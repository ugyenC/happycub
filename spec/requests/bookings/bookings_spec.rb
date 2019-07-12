require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'Booking controller request specs' do
    login_user

    let!(:user){create :user}
    let!(:event){create :event}
    #let!(:guest){create :guest}

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'should create an event and generate a notice.' do
      params = {
       fname: 'test',
       lname: 'test',
       age: 13
      }
      post(:create, params: {booking: params})
      #expect(flash[:notice]).to eq "Event was successfully created."
    end

    it 'should delete a user and display a success notice' do
      expect { delete :destroy, params: { id: booking.id } }
      user.reload
      #expect(flash[:success]).to eq 'News successfully removed.'
    end

  end
end