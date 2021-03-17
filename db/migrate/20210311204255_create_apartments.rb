class CreateApartments < ActiveRecord::Migration[6.0]
  def change
    create_table :apartments do |t|
      t.integer :price
      t.string :location
      t.integer :num_bath
      t.string :num_bdrms
      t.string :furniture_amt
      t.string :status
      t.string :description
      t.integer :user_id
      t.integer :photos_count
      t.integer :interested_buyers_count

      t.timestamps
    end
  end
end
