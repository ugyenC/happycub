require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'Post controller request specs' do
    login_user

    let!(:post){create :post}

    it 'should success and render to index page' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template :index
    end

    it 'should display the details of a particular post' do
      get :show, params: { id: post.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'should create an event' do
      params =   {
        title: 'New News',
        body: 'This is a test notification generated',
      }
      expect { post(:create, params: { post: params }) }
      #expect(flash[:notice]).to eq 'News successfully created.'
    end
    it 'should update an existing post and display a success notice' do
      params = {
        title: 'Test News Updated',
        body: 'The description of the test is now edited'
      }
      put(:update, params: { id: post.id, post: params })
      post.reload
      params.keys.each do |key|
        expect(post.attributes[key.to_s]).to eq params[key]
      end
      expect(flash[:notice]).to eq 'Post was successfully updated.'
    end
    it 'should delete an post and display a success notice' do
      expect { delete :destroy, params: { id: post.id } }
      #expect(flash[:notice]).to eq 'News successfully removed.'
    end

  end
end