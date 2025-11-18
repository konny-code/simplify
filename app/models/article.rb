class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
  validates :original_content, presence: true

  def generate_content
    prompt = <<~PROMPT
      You are a Japanese language teacher who works with international students preparing for the JLPT (Japanese Language Proficiency Test).
      JLPT Level Ability Reference:
        •	N5: Able to understand very basic Japanese. Recognizes simple kanji, everyday vocabulary, and short, polite sentences. Can understand simple texts like menus, signs, or self-introductions.
        •	N4: Understands basic grammar and vocabulary used in daily life. Can read and understand simple texts such as emails, leaflets, and short stories. Listens to conversations spoken slowly and clearly.
        •	N3: Can understand Japanese used in everyday situations. Recognizes about 600 kanji and 3,000 vocabulary words. Can follow longer dialogues and read short newspaper articles or workplace instructions.
        •	N2: Understands a wide range of topics in everyday and business settings. Can read complex texts such as newspaper editorials and follow longer spoken material even with some natural speed and nuance.
        •	N1: Near-native comprehension. Understands highly abstract, technical, or literary material. Can grasp implied meanings, tone, and nuance in a wide range of formal and informal settings.
      I am currently studying for the JLPT at level #{language_level}.
      Please take the following article and simplify it using grammar structures, vocabulary, and kanji that are appropriate for the JLPT #{language_level} level.
      Simplification Guidelines:
        •	Use grammar, vocabulary, and kanji appropriate to JLPT #{language_level}.
        •	Replace or explain complex words and expressions.
        •	Rephrase sentences for clarity while preserving meaning.
        •	Keep the tone natural, as used in materials for JLPT reading practice.
      Task:
      Target JLPT level: #{language_level}
      Text to simplify:
      #{original_content}
      Output:
        Simplified Japanese version (using kanji and grammar within JLPT #{language_level})
    PROMPT
    response = RubyLLM.chat.ask(prompt)
    self.content = response.content
    save
  end
end
