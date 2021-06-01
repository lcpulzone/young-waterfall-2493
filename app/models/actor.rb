class Actor < ApplicationRecord
  has_many :film_relations
  has_many :movies, through: :film_relations
end
