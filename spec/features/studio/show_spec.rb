require 'rails_helper'

RSpec.describe 'studio show page' do
  before :each do
    @big = Studio.create!(name: 'The Big Time Studio', location: 'Tacoma')
    @movie_1 = @big.movies.create!(title: 'movie 1', creation_year: 1995)
    @movie_2 = @big.movies.create!(title: 'movie 2', creation_year: 1999)
    @movie_3 = @big.movies.create!(title: 'movie 3', creation_year: 2007)

    @rainer = Studio.create!(name: 'Rainer Films', location: 'Seattle')
    @movie_4 = @rainer.movies.create!(title: 'movie 4', creation_year: 2019)
    @movie_5 = @rainer.movies.create!(title: 'movie 5', creation_year: 2017)
    @movie_6 = @rainer.movies.create!(title: 'movie 6', creation_year: 2018)
    @movie_7 = @rainer.movies.create!(title: 'movie 7', creation_year: 2021)
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
    expect(page).to_not have_content("#{@movie_7.title}")
  end
end
