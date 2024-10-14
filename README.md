# image-classifier-demo

Simple demo for building image classification by utilizing Langchain.rb, LLMs and function calling. 

### Installation
1. `git clone`
2. `bundle install`
3. `cp .env.example .env` and fill it out with [OpenAI API key](https://platform.openai.com/api-keys).

### Running
```ruby
bundle exec ruby image-classifier.rb --url=<your-image-url>
```

You can try the script with by passing this image URL:
```ruby
bundle exec ruby image-classifier.rb --url="https://gist.githubusercontent.com/andreibondarev/b6f444194d0ee7ab7302a4d83184e53e/raw/db2e55ce2d29f3f6a7e3540e5abfd451c6a3d2a8/sf-cable-car.jpg"
```
