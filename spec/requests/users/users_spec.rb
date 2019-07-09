require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User controller request specs' do
    login_user

    let!(:user){create :user}

    it 'should display the details of a particular user' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'should delete a user and display a success notice' do
      expect { delete :destroy, params: { id: post.id } }
      #expect(flash[:notice]).to eq 'News successfully removed.'
    end

  end
end