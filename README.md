# Simplify

A web-based Japanese language learning application that helps international students preparing for the JLPT (Japanese Language Proficiency Test) understand news articles and content at their proficiency level.

## About

Simplify uses AI to transform complex Japanese text into learner-friendly content. Users paste Japanese articles, and the app automatically simplifies the text based on their JLPT level (N5-N1), breaking it down into interactive sentence segments with word-by-word analysis.

## Features

- **AI-Powered Simplification** - Paste any Japanese article and get a simplified version tailored to your JLPT level
- **Interactive Word Analysis** - Hover over any word to see its reading (hiragana), meaning, and grammatical role
- **Vocabulary Bookmarking** - Save words to your favorites for later review
- **AI Chat Assistant** - Ask questions about the article's content, grammar, or cultural context
- **Progress Tracking** - Manage your simplified articles and saved vocabulary in one place

## Tech Stack

**Backend**
- Ruby 3.3.5
- Rails 7.1.6
- PostgreSQL

**Frontend**
- Hotwire (Turbo + Stimulus)
- Bootstrap 5.3
- SCSS

**AI Integration**
- GitHub Models API (Azure OpenAI)
- ruby_llm gem

**Authentication**
- Devise

## Getting Started

### Prerequisites

- Ruby 3.3.5
- PostgreSQL
- Node.js
- A GitHub token with access to GitHub Models API

### Installation

1. Clone the repository
```bash
git clone https://github.com/konny-code/simplify.git
cd simplify
```

2. Install dependencies
```bash
bundle install
```

3. Set up environment variables

Create a `.env` file in the root directory:
```
GITHUB_TOKEN=your_github_token_here
```

4. Set up the database
```bash
bin/rails db:prepare
```

5. Start the server
```bash
bin/rails server
```

6. Visit `http://localhost:3000`

### Docker

```bash
docker build -t simplify .
docker run -p 3000:3000 -e GITHUB_TOKEN=your_token simplify
```

## Usage

1. **Sign up** and select your JLPT level (N5-N1)
2. **Create an article** by pasting Japanese text
3. **Explore** the simplified content with interactive word tooltips
4. **Bookmark** vocabulary words you want to remember
5. **Chat** with the AI assistant to clarify grammar or cultural context

## Database Schema

```
users ─────────────┬──── articles ──── translations ──── favorites
                   │         │
                   │         └──── chats ──── messages
                   │
                   └──── favorites
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is open source and available under the [MIT License](LICENSE).

## Acknowledgments

- Built with [Le Wagon](https://www.lewagon.com) Rails templates
- AI powered by GitHub Models API
