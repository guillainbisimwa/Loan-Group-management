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

    it 'should have many myloans' do
      t = User.reflect_on_association(:myloans)
      expect(t.macro).to eq(:has_many)
    end
  end
end
