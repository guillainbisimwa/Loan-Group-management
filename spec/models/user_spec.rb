require 'rails_helper'

RSpec.describe User do
  describe 'Creating of User' do
    subject { User.create(name: 'Guy') }

    it 'confirms count of users increase by 1' do
      expect { subject }.to change { User.count }.by(1)
    end

    it 'confirms the name of the new user' do
      expect(subject.name).to eq('Guy')
    end

    it 'fails for an invalid name for the new user' do
      expect(subject.name).to_not eq('Jeff')
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe 'User associations' do
    it 'should have many groups' do
      t = User.reflect_on_association(:groups)
      expect(t.macro).to eq(:has_many)
    end

    it 'should have many myloans' do
      t = User.reflect_on_association(:myloans)
      expect(t.macro).to eq(:has_many)
    end
  end

  describe 'User model scopes' do
    let(:user) { User.create(name: 'Guy') }
    let(:loan) { Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id) }
    let(:loan2) { Loan.create(name: 'Nothing2', amount: 400.0, author_id: user.id) }
    let(:loan3) { Loan.create(name: 'Nothing3', amount: 800.0, author_id: user.id) }

    let(:user_all_loans) { User.user_all_loans(user) }

    it "includes loans and return loan's array" do
      expect(user_all_loans).to include(loan, loan2, loan3)
      expect(user_all_loans).to match_array [loan, loan2, loan3]
    end
  end
end
