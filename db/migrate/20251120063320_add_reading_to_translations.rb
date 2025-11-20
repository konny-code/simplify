class AddReadingToTranslations < ActiveRecord::Migration[7.1]
  def change
    add_column :translations, :reading, :string
  end
end
