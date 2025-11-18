class CreateTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :translations do |t|
      t.text :word
      t.text :definition
      t.references :article, null: false, foreign_key: true

      t.timestamps
    end
  end
end
