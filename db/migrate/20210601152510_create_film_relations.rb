class CreateFilmRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :film_relations do |t|
      t.references :movie, foreign_key: true
      t.references :actor, foreign_key: true

      t.timestamps
    end
  end
end
