require "langchain"
require "./image-classifier.rb"
require "bundler/setup"
Bundler.require
require "dotenv/load"

#Langchain.logger.level = Logger::ERROR

llm = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])

assistant = Langchain::Assistant.new(
  llm: llm,
  instructions: "You're a helpful AI assistant",
  tools: [ImageClassifier.new],
  tool_choice: "image_classifier__classify"
)

puts "Processing image..."

messages = assistant.add_message_and_run image_url: "https://gist.githubusercontent.com/andreibondarev/b6f444194d0ee7ab7302a4d83184e53e/raw/db2e55ce2d29f3f6a7e3540e5abfd451c6a3d2a8/sf-cable-car.jpg"

puts messages.last.tool_calls
