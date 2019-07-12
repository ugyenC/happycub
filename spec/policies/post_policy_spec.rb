require 'rails_helper'
describe PostPolicy do
  subject{PostPolicy.new(user, post)}
  let(:post){create :post}

  context "for a user" do
    let(:user) { create :user , admin: false }
    it { should print(:show)    }
  end

  context "for a admin" do
    let(:user) { create :user, admin: true }
    it { should print(:show)}
    it { should print(:create)}
    it { should print(:new)     }
    it { should print(:update)  }
    it { should print(:edit)    }


  end

end