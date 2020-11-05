class CreateWriters < ActiveRecord::Migration[6.0]
  def change
    create_table :writers do |t|
      t.string :name
      t.integer :birth_year
      t.string :country

      t.timestamps
    end
  end
end
