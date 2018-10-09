class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :exp_type
      t.text :summary
      t.string :address
      t.boolean :active
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
