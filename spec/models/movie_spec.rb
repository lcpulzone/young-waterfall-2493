require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:film_relations) }
    it { should have_many(:actors).through(:film_relations) }
  end
end
