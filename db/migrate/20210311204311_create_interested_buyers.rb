class CreateInterestedBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :interested_buyers do |t|
      t.integer :apt_id
      t.string :email
      t.string :name
      t.string :phone_number

      t.timestamps
    end
  end
end
