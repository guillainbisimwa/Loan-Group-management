require 'rails_helper'

RSpec.describe Loan do
  describe 'Creating an Loan' do
    let(:user) { User.create(name: 'Guy') }

    let(:loan) { Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id) }

    subject { Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id) }

    it 'confirms the name of the new loan' do
      expect(loan.name).to eq('Contribution')
    end

    it 'change the count of loan by one' do
      expect { subject }.to change { Loan.count }.by(1)
    end

    it 'fails for an invalid name for the new loan' do
      expect(subject.name).to_not eq('')
    end

    it 'confirms the amount of the new loan' do
      expect(subject.amount).to eq(200)
    end

    it 'loan amount should be a float' do
      expect(subject.amount).to be_an_instance_of(Float)
    end

    it 'loan amount should not be a text' do
      expect(subject.amount).to_not be_an_instance_of(String)
    end

    it 'fails for an invalid amount for the new loan' do
      expect(subject.amount).to_not eq(20)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe 'Loan associations' do
    it 'should have many grouploans' do
      t = Loan.reflect_on_association(:grouploans)
      expect(t.macro).to eq(:has_many)
    end

    it 'should belong to creditor' do
      expect { Loan belong_to(:user) }
    end
  end

  describe 'Loan model scopes' do
    let(:user) { User.create(name: 'Guy') }
    let(:loan) { Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id) }
    let(:group) { Group.create(name: 'Barcelona', user_id: user.id) }
    subject { Group.create(name: 'Barcelona', user_id: user.id) }
    let(:grouploan) { Grouploan.create(loan_id: loan.id, group_id: subject.id) }

    let(:ex_loans) { Loan.ex_loans(user) }

    let(:internal_loans) { Loan.internal_loans(group) }

    it "includes group and return loan's array" do
      expect(ex_loans).to include(loan)
      expect(ex_loans).to match_array [loan]
    end

    it "includes group and return loan's array2" do
      expect(internal_loans).to include(subject)
      # expect( internal_loans ).to match_array [subject]
    end
  end
end
