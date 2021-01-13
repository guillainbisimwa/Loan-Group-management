require 'rails_helper'

RSpec.describe Loan do
  describe 'Creating an Loan' do
    let(:user) { User.create(name: 'Guy') }

    let(:loan) { Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id) }

    it 'confirms the name of the new loan' do
      expect(loan.name).to eq('Contribution')
    end

    it 'fails for an invalid name for the new loan' do
      expect(loan.name).to_not eq('')
    end

    it 'confirms the amount of the new loan' do
      expect(loan.amount).to eq(200)
    end

    it 'fails for an invalid amount for the new loan' do
      expect(loan.amount).to_not eq(20)
    end

    it 'should have many grouploans' do
      t = Loan.reflect_on_association(:grouploans)
      expect(t.macro).to eq(:has_many)
    end

    it 'should belong to creditor' do
      expect { Loan belong_to(:user) }
    end
  end
end
