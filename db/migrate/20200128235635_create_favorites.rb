class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.date :date
      t.boolean :visit
      t.string :comment
      t.integer :user_id
      t.integer :park_id

      t.timestamps
    end
  end
end
