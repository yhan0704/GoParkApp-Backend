class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :sitecode
      t.string :timestart
      t.string :timesend
      t.date :date
      t.boolean :free
      t.integer :park_id

      t.timestamps
    end
  end
end
