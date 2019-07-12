require 'rails_helper'

describe Guest do

  describe 'Validations' do
    it { should validate_presence_of(:fname) }
    it { should validate_length_of(:fname).is_at_most(100) }
    it { should validate_presence_of(:lname) }
    it { should validate_length_of(:lname).is_at_most(100) }
    it { should validate_presence_of(:age) }
    it { should belong_to(:booking)}


  end

end