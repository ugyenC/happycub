require 'rails_helper'

describe User do

  describe 'Validations' do

    it { should have_many(:bookings)}
    it { should have_many(:events).through(:bookings)}
    it { should have_many(:posts)}

  end

  describe User, '#full_name' do
    it 'returns the concatenated first and last name' do
      validate_presence_of(fname: 'josh', lname: 'steiner')
      user = build(:user, fname: 'josh', lname: 'steiner')
      user.valid?
      expect(user.full_name).to eq 'Josh Steiner'
    end
  end

end