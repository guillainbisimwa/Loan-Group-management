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

    before(:context) do
      user = User.create(name: 'Guy')
      group = Group.create(name: 'group', user_id: user.id)
      loan1 = Loan.create(name: 'Contribution1', amount: 200.0, author_id: user.id)
      loan2 = Loan.create(name: 'Contribution2', amount: 400.0, author_id: user.id)
      loan3 = Loan.create(name: 'Contribution3', amount: 300.0, author_id: user.id)
      grouploan = Grouploan.create(loan_id: loan2.id, group_id: group.id)
    end
  let(:ex_loans) { Loan.ex_loans(User.last) }
  let(:external_loans_count) { Loan.external_loans_count(User.last) }
  let(:external_loans_sum) { Loan.external_loans_sum(User.last) }

  let(:internal_loans) { Loan.internal_loans(Group.last) }
  let(:internal_loans_count) { Loan.internal_loans_count(Group.last) }
  let(:internal_loans_sum) { Loan.internal_loans_sum(Group.last) }

   
    it "includes group and return external loan's array" do
      expect(ex_loans).to include(Loan.where(name: "Contribution3").last)
      expect(ex_loans).to_not be_empty
      expect(ex_loans).to match_array [Loan.where(name: "Contribution1").last, Loan.where(name: "Contribution3").last]
    end

    it "includes group and return the nombrer of external's loans" do
      expect(external_loans_count).to eq(2)
    end

    it "includes group and return the sum of external's loans" do
      expect(external_loans_sum).to eq(500.0)
    end

    it "includes group and return internal loan's array" do
      expect(internal_loans).to include(Loan.where(name: 'Contribution2').last)
    end

    it "includes group and return the nombrer of internal's loans" do
      expect(internal_loans_count).to eq(1)
    end

    it "includes group and return the sum of internal's loans" do
      expect(internal_loans_sum).to eq(400.0)
    end

    it "includes group and return the incorrect sum of internal's loans" do
      expect(internal_loans_sum).to_not eq(400.1)
    end
  end
end
