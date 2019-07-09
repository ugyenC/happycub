require 'rails_helper'

describe 'Referrer' do
  # include_context 'job mocks'

  let!(:event) {{
    event: {
      title: 'welcome',
      start_date: Date.today,
      location: 'Thimphu',
      descrption: 'This is test test test',
      capacity: 12
    }
  }}


    it 'should be able to create event ' do
      # request.cookies[:_happyclub_session] = cookie_params
      #sign_in create(:user, { email: 'cugyen20@gmail.com', password: 'Seilise88' })
      post events_path, params: event
      binding.pry
      # expect(status).to eq(200)
      # expect(json.dig(:news, :title)).to eq('News 1')
      # expect(json.dig(:news, :description)).to eq('This news just happened 3 days back')
      # expect(json.dig(:news, :image_path_large)).to be_present
      # expect(json.dig(:news, :photos_attributes).size).to eq(2)
      # expect(json.dig(:news, :documents_attributes).size).to eq(2)
    end
end
