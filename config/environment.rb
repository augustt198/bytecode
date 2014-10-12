# Load the Rails application.
require File.expand_path('../application', __FILE__)
require 'open3'

# Initialize the Rails application.
Rails.application.initialize!

Haml::Template.options[:ugly] = true

Rails.application.config.themes = {
  light: %w{
    chrome clouds crimson_editor dawn dreamweaver
    eclipse github kuroir solarized_light
    textmate tomorrow xcode
  },
  dark: %w{
    ambiance chaos clouds_midnight cobalt
    idle_fingers merbivore merbivore_soft
    mono_industrial monokai pastel_on_dark
    solarized_dark terminal tomorrow_night
    tomorrow_night_blue tomorrow_night_bright
    tomorrow_night_eighties twilight
    vibrant_ink
  }
}

dropdown_themes = {}

Rails.application.config.themes.values.flatten.sort do |a, b|
  a <=> b
end.each do |theme|
  dropdown_themes[theme] = theme.split('_').map(&:capitalize).join(' ')
end

Rails.application.config.dropdown_themes = dropdown_themes
