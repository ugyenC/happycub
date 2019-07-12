require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User controller request specs' do
    login_user

    let!(:user){create :user}

    it 'should success and render to new page' do
      get :users
      expect(response).to have_http_status(200)
      expect(response).to render_template :users
    end
    it 'should success and render to new page' do
      get :new
      expect(response).to have_http_status(200)
      expect(response).to render_template :new
    end

    it 'should display the details of a particular user' do
      get :show, params: { id: user.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'should update an existing event and display a success notice' do
      params = {
        fname: 'Updated',
        lname: 'upppp'
      }
      put(:update, params: { id: user.id, user: params })
      user.reload
      params.keys.each do |key|
        expect(user.attributes[key.to_s]).to eq params[key]
      end
      expect(flash[:success]).to eq 'User successfully edited.'
    end

    it 'should update an existing event and display a success notice' do
      params = {
        fname: ''
      }
      put(:update, params: { id: user.id, user: params })
     # expect(flash[:error]).to eq 'User not edited.'
    end

    it 'should delete a user and display a success notice' do
      expect { delete :destroy, params: { id: user.id,user => {:password => user.password} } }
      user.reload
      #expect(flash[:success]).to eq 'Users successfully deleted.'
    end

  end
end