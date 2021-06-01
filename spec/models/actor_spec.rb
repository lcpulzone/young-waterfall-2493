require 'rails_helper'

RSpec.describe Actor do
  describe 'relationships' do
    it { should have_many(:film_relations) }
    it { should have_many(:movies).through(:film_relations) }
  end
end
