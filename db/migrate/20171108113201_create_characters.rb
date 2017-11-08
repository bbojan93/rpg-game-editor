class CreateCharacters < ActiveRecord::Migration[5.1]
  def change
    create_table :characters do |t|
      t.integer :name
      t.string :avatar
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
