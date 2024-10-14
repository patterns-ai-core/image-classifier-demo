# frozen_string_literal: true

# Parse command line arguments
url = nil
ARGV.each_with_index do |arg, index|
  if arg.start_with?('--url=')
    url = arg.split('=', 2)[1]
    break
  elsif arg == '--url' && index + 1 < ARGV.length
    url = ARGV[index + 1]
    break
  end
end

if url.nil?
  puts "Error: --url parameter is required"
  puts "Usage: bundle exec ruby main.rb --url <your_url>"
  exit 1
end

require "langchain"
require "./tools/image-classifier-tool.rb"
require "bundler/setup"
Bundler.require
require "dotenv/load"

# Silence the logger
Langchain.logger.level = Logger::ERROR

llm = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])

assistant = Langchain::Assistant.new(
  llm: llm,
  instructions: "You're a helpful AI assistant",
  tools: [ImageClassifierTool.new],
  tool_choice: "image_classifier_tool__classify"
)

puts "Processing image..."

messages = assistant.add_message_and_run(image_url: url)

_, _, _, tool_arguments = assistant.llm_adapter.extract_tool_call_args(tool_call: messages.last.tool_calls.first)

pp(tool_arguments)