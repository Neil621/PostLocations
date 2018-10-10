class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :exp_type
      t.text :summary
      t.string :address
      t.string :listing_name
      t.boolean :active
      t.integer :price
      t.references :user, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
