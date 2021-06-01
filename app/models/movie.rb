class Movie < ApplicationRecord
  belongs_to :studio
  has_many :film_relations
  has_many :actors, through: :film_relations
end
