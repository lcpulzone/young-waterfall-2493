require 'rails_helper'

RSpec.describe 'studio show page' do
  before :each do
    @big = Studio.create!(name: 'The Big Time Studio', location: 'Tacoma')
    @movie_1 = @big.movies.create!(title: 'movie 1', creation_year: 1995, genre: 'horror')
    @movie_2 = @big.movies.create!(title: 'movie 2', creation_year: 1999, genre: 'comedy')
    @movie_3 = @big.movies.create!(title: 'movie 3', creation_year: 2007, genre: 'action')
    @ted = Actor.create!(name: 'Ted Licious', age: 1, currently_working: true)
    @brittany = Actor.create!(name: 'Brittany Counts', age: 36, currently_working: true)
    @caleb = Actor.create!(name: 'Caleb Notouch', age: 37, currently_working: false)
    FilmRelation.create!(movie_id: @movie_1.id, actor_id: @ted.id)
    FilmRelation.create!(movie_id: @movie_1.id, actor_id: @brittany.id)
    FilmRelation.create!(movie_id: @movie_1.id, actor_id: @caleb.id)

    @rainer = Studio.create!(name: 'Rainer Films', location: 'Seattle')
    @movie_4 = @rainer.movies.create!(title: 'movie 4', creation_year: 2019)
    @movie_5 = @rainer.movies.create!(title: 'movie 5', creation_year: 2017)
    @movie_6 = @rainer.movies.create!(title: 'movie 6', creation_year: 2018)
  end

  it 'can show studios attributes and movies' do
    visit "/studios/#{@big.id}"

    expect(page).to have_content("#{@big.name}")
    expect(page).to have_content("#{@big.location}")
    expect(page).to have_content("#{@movie_1.title}")
    expect(page).to have_content("#{@movie_2.title}")
    expect(page).to have_content("#{@movie_3.title}")

    expect(page).to_not have_content("#{@rainer.name}")
    expect(page).to_not have_content("#{@rainer.location}")
    expect(page).to_not have_content("#{@movie_4.title}")
    expect(page).to_not have_content("#{@movie_5.title}")
    expect(page).to_not have_content("#{@movie_6.title}")
  end

  it 'can show actors attributes if they are currently working' do
    visit "/studios/#{@big.id}"

    expect(page).to have_content(@ted.name)
    expect(page).to have_content(@ted.age)

    expect(page).to_not have_content(@caleb.name)
    expect(page).to_not have_content(@caleb.age)
  end
end
