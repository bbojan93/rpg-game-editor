class CreateCharacterAttributes < ActiveRecord::Migration[5.1]
  def change
    create_table :character_attributes do |t|
      t.string :icon
      t.string :attribute_name
      t.integer :attribute_value
      t.references :character, index: true, foreign_key: true

      t.timestamps
    end
  end
end
