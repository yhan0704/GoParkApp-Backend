class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :contactname
      t.string :contactemailaddress
      t.string :parkCode
      t.string :timestart
      t.string :timesend
      t.date :date
      t.boolean :free
      t.integer :park_id

      t.timestamps
    end
  end
end
