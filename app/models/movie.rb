class Movie < ApplicationRecord
  belongs_to :studio
  has_many :film_relations
  has_many :actors, through: :film_relations

  def age_sort
    actors.order(age: :desc)
  end
end
