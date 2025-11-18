class AddOriginalContentToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :original_content, :text
  end
end
