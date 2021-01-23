require 'rails_helper'

RSpec.describe LoansHelper, type: :helper do
  describe "Check if icon's loan is valid" do
    let(:user) { User.create(name: 'GuyIcon') }
    let(:loan) { Loan.create(name: 'LaonIcon', amount: 200.0, author_id: user.id) }
    let(:secondloan) { Loan.create(name: 'LaonIcon3', amount: 300.0, author_id: user.id) }
    let(:group) { Group.create(name: 'GroupIcon', user_id: user.id) }
    let(:grouploan) { Grouploan.create(loan_id: loan.id, group_id: group.id) }

    it 'returns a person icon' do
      expect(helper.icon_loan(loan)).to include('person')
    end

    it 'returns a unknown icon' do
      expect(helper.icon_loan(loan)).to_not include('unknown')
    end

    it 'not returns an empty result' do
      expect(helper.all_loans(Loan.all)).to_not be_empty
    end
  end
end
