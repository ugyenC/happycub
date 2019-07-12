require 'rails_helper'

describe Post do

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
    it { should validate_length_of(:title).is_at_least(5) }
    it { should belong_to(:user)}

  end

end