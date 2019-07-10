require 'rails_helper'

describe User do

  describe 'Validations' do

    it { should have_many(:bookings)}
    it { should have_many(:events).through(:bookings)}
    it { should have_many(:posts)}

  end

end