require 'rails_helper'

RSpec.describe Group do
  describe 'Creating an Group' do
    let(:group) { Group.create(name: 'Barcelona') }

    it 'confirms the name of the new group' do
      expect(group.name).to eq('Barcelona')
    end

    it 'fails for an invalid name for the new group' do
      expect(group.name).to_not eq('Real Madrid')
    end

    it 'should have many grouploans' do
      t = Group.reflect_on_association(:grouploans)
      expect(t.macro).to eq(:has_many)
    end

    it 'should belong to author' do
      expect { Group belong_to(:user) }
    end
  end
end