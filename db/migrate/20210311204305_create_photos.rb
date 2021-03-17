class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.integer :apt_id
      t.string :picture

      t.timestamps
    end
  end
end
