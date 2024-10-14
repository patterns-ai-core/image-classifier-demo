# frozen_string_literal: true

class ImageClassifierTool
  extend Langchain::ToolDefinition

    define_function :classify, description: "Classify photo" do
      property :main_subject, 
        description: "Primary subject of the photo",
        type: "string",
        required: true
      property :scene_type,
        description: "Scene setting in the photo",
        type: "string",
        required: true,
        enum: ["urban", "rural", "indoor", "outdoor"]
      property :colors,
        description: "Dominant colors in the photo",
        type: "array",
        required: true do
          item type: "string"
        end
      property :objects,
        description: "List of key objects visible in the image",
        type: "array",
        required: true do
          item type: "string"
        end
      property :actions,
        description: "Activities or movements captured",
        type: "array",
        required: true do
          item type: "string"
        end
      property :number_of_humans,
        description: "Number of people if present",
        type: "number",
        required: true
      property :weather_conditions,
        description: "Weather conditions",
        type: "string",
        required: true,
        enum: ["sunny", "cloudy", "rainy", "snowy", "foggy"]
      property :time_of_day,
        description: "Time of day",
        type: "string",
        required: true,
        enum: ["morning", "afternoon", "evening", "night"]
      property :mood,
        description: "Overall feeling conveyed by the photo",
        type: "string",
        required: true
  end
end

