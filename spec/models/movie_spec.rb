require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it { should have_many(:film_relations) }
    it { should have_many(:actors).through(:film_relations) }
  end

  describe 'actor logic' do

    it 'can sort actors by oldest to youngest' do
      big = Studio.create!(name: 'The Big Time Studio', location: 'Tacoma')
      movie_1 = big.movies.create!(title: 'movie 1', creation_year: 1995)
      ted = Actor.create!(name: 'Ted Licious', age: 1, currently_working: true)
      brittany = Actor.create!(name: 'Brittany Counts', age: 36, currently_working: true)
      caleb = Actor.create!(name: 'Caleb Notouch', age: 37, currently_working: false)
      FilmRelation.create!(movie_id: movie_1.id, actor_id: ted.id)
      FilmRelation.create!(movie_id: movie_1.id, actor_id: brittany.id)
      FilmRelation.create!(movie_id: movie_1.id, actor_id: caleb.id)

      expect(movie_1.age_sort).to eq([caleb, brittany, ted])
    end
  end
end
