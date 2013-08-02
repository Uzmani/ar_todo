require_relative 'config/application'
require_relative 'app/controllers/controller.rb'

puts "Put your application code in #{File.expand_path(__FILE__)}"

Controller.run