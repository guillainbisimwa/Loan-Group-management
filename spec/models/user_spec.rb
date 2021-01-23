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
    before(:context) do
      user = User.create(name: 'Ruth')
      Loan.create(name: 'Contribution', amount: 200.0, author_id: user.id)
      Loan.create(name: 'Nothing2', amount: 400.0, author_id: user.id)
      Loan.create(name: 'Nothing3', amount: 800.0, author_id: user.id)
    end

    let(:user_all_loans) { User.user_all_loans(User.last) }
    let(:user_all_loans_count) { User.user_all_loans_count(User.last) }
    let(:user_all_loans_sum) { User.user_all_loans_sum(User.last) }

    it "includes loans and return all loan's array" do
      expect(user_all_loans).to include(Loan.where(name: 'Nothing2').last)
      expect(user_all_loans).to_not be_empty
      expect(user_all_loans).to match_array [Loan.where(name: 'Contribution').last,
                                             Loan.where(name: 'Nothing2').last, Loan.where(name: 'Nothing3').last]
    end

    it "includes loans and return the nombrer of all user's loans" do
      expect(user_all_loans_count).to eq(3)
    end

    it "includes loans and return the sum of user's loans" do
      expect(user_all_loans_sum).to_not eq(500.0)
      expect(user_all_loans_sum).to eq(1400.0)
    end
  end
end
