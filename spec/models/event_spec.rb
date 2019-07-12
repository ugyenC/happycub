require 'rails_helper'

describe Event do

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:location) }
  end

  describe 'Associations' do
    it { should have_many(:bookings).inverse_of(:event).dependent(:destroy)}
    it { should have_many(:users).through(:bookings)}
  end

  describe "Methods" do
    it ""

  end

  end