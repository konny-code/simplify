class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
  validates :original_content, presence: true

  def generate_content
    prompt = <<~PROMPT
      You are a Japanese language teacher experienced in working with international students.
      I am a student learning japanese.
      Help me read this article according to the JLPT #{language_level} level.
      Answer it with words and kanji that I should be able to understand according to my language level.
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    self.content = response
  end
end
