class AddSentencesToArticles < ActiveRecord::Migration[7.1]
  def change
    add_column :articles, :sentences, :jsonb, default: []
  end
end
