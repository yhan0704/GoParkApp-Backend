class CreateParks < ActiveRecord::Migration[6.0]
  def change
    create_table :parks do |t|
      t.string :fullName
      t.string :states
      t.string :latLong
      t.string :description
      t.string :parkCode
      t.string :image_url
      t.string :weatherInfo

      t.timestamps
    end
  end
end
