class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
  validates :original_content, presence: true

  def generate_content
    prompt = <<~PROMPT
      You are a Japanese language teacher experienced in working with international students.
      I am a student learning japanese and I want to improve my reading skills.
      The JLPT has five levels, N1 to N5, with N5 being the easiest and N1 being the most difficult. Levels N4 and N5 are for basic, classroom-level Japanese, while N1 and N2 test the ability to understand Japanese used in a wide range of real-life situations. N3 serves as a bridge between these levels, testing a degree of everyday Japanese understanding.
      Language level breakdown as follow:
      N5: The most basic level, assessing the ability to understand some basic Japanese and simple, slow conversations on familiar topics. This is suitable for understanding short, common sentences and simple messages like advertisements or menus.
      N4: Covers a more comprehensive understanding of basic Japanese, with the ability to read and understand everyday topics and slowly spoken conversations. This level is for understanding simple letters and brochures.
      N3: A bridge between basic and advanced levels, testing the ability to understand Japanese used in everyday situations to a certain degree. This level requires understanding of about 90% of daily conversation vocabulary and is suitable for internships or jobs requiring more fluid verbal communication.
      N2: Assesses the ability to understand Japanese used in a variety of circumstances and everyday situations to a certain degree. This level demonstrates the proficiency needed for full-time jobs and undergraduate/graduate programs in Japan that are taught in Japanese.
      N1: The most advanced level, measuring the ability to understand a wide range of Japanese, including reading complex texts and understanding nuanced meanings in passages. This level qualifies individuals for roles requiring a high degree of Japanese proficiency, such as highly technical translation or positions in Japanese companies.
      Simplify the article changing the original wordsm characters and grammar points according to the JLPT #{language_level} level.
      #{original_content}
      Answer it with words and kanji that I should be able to understand according to my language level.
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    self.content = response.content
  end
end
