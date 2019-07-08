require 'rails_helper'

describe 'Referrer' do
  # include_context 'job mocks'

  let!(:referrer) {

  }


  describe 'Referrers' do



    # let!(:referrer) { {
    #   news: {
    #     title: 'News 1',
    #     description: 'This news just happened 3 days back',
    #     photos_attributes: [
    #       {
    #         default: true,
    #         image: fixture_file_upload(Rails.root.join('public', 'default', 'photo.png'), 'image/png')
    #       },
    #       {
    #         image: fixture_file_upload(Rails.root.join('public', 'default', 'photo.png'), 'image/png')
    #       }
    #     ],
    #     documents_attributes: [
    #       {
    #         file: fixture_file_upload(Rails.root.join('public', 'default', 'photo.png'), 'image/png')
    #       },
    #       {
    #         file: fixture_file_upload(Rails.root.join('public', 'files', 'user_invite.csv'), 'text/csv')
    #       }
    #     ]
    #   }
    # } }

    it 'should be created with referre ' do
      binding.pry
      post api_v1_referrer_path, header_params(token: user)
      binding.pry
      # post api_v1_news_index_path, params: news_params, headers: header_params(token: token)
      #
      # expect(status).to eq(200)
      # expect(json.dig(:news, :title)).to eq('News 1')
      # expect(json.dig(:news, :description)).to eq('This news just happened 3 days back')
      # expect(json.dig(:news, :image_path_large)).to be_present
      # expect(json.dig(:news, :photos_attributes).size).to eq(2)
      # expect(json.dig(:news, :documents_attributes).size).to eq(2)
    end
  end
end
