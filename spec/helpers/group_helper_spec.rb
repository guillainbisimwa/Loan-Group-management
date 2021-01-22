require 'rails_helper'

RSpec.describe GroupsHelper, type: :helper do
    describe "Loan" do
        let(:user) { User.create(name: 'Plink') }
        let(:loan) { Loan.create(name: 'LaonPlink', amount: 200.0, author_id: user.id) }
        let(:secondloan) { Loan.create(name: 'LaonPLink2', amount: 300.0, author_id: user.id) }
        let(:group) { Group.create(name: 'GroupLink', user_id: user.id) }
        let(:grouploan) { Grouploan.create(loan_id: loan.id, group_id: group.id) }
    
        it 'returns a the name of the author' do
          expect(helper.loan_author(loan)).to include('Plink')
        end
    
        it 'returns a bad name of the author' do
          expect(helper.loan_author(secondloan)).to_not include('unknown')
        end
      end
end
