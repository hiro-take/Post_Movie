class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.binary :video, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
