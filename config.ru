# This file is used by Rack-based servers to start the application.
require 'sprockets'

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'app/assets/javascripts'
  environment.append_path 'app/assets/stylesheets'
  environment.js_compressor  = :uglify
  environment.css_compressor = :scss

  run environment
end
