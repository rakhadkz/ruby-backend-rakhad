class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.belongs_to :catalog, index: true

      t.timestamps
    end
  end
end
