require 'rails_helper'

RSpec.describe Grouploan, type: :model do
  it 'should belong to loan' do
    expect { Grouploan belong_to(:loan) }
  end

  it 'should belong to group' do
    expect { Grouploan belong_to(:group) }
  end
end
