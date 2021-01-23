require 'rails_helper'

RSpec.describe Group do
  describe 'Creating an Group' do
    let(:user) { User.create(name: 'Guy') }

    subject { Group.create(name: 'Barcelona', user_id: user.id) }

    it 'change the count of group by one' do
      expect { subject }.to change { Group.count }.by(1)
    end

    it 'confirms the name of the new group' do
      expect(subject.name).to eq('Barcelona')
    end

    it 'fails for an invalid name for the new group' do
      expect(subject.name).to_not eq('Real Madrid')
    end

    it 'confirms the owner of the new group' do
      expect(subject.user_id).to eq(user.id)
    end
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  describe 'Group associations' do
    it 'should have many grouploans' do
      t = Group.reflect_on_association(:grouploans)
      expect(t.macro).to eq(:has_many)
    end

    it 'should belong to author' do
      expect { Group belong_to(:author) }
    end

    it 'has many loans' do
      t = Group.reflect_on_association(:loans)
      expect(t.macro).to eq(:has_many)
    end
  end
end
