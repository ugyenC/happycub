require 'rails_helper'

describe Booking do

  describe 'Validations' do
    it { should belong_to(:user)}
    it { should belong_to(:event)}
    it { should have_many(:guests)}

  end

end