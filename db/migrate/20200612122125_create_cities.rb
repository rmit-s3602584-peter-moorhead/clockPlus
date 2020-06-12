class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :value
      t.string :abbr
      t.integer :offset
      t.boolean :isdst
      t.string :text
      t.text :utc

      t.timestamps
    end
  end
end
