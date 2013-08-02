require 'faker'
require_relative '../app/models/task.rb'

5.times do
  p Task.create({description: Faker::Lorem.sentence(word_count = 4, random_words_to_add = 6),
                status: 'incomplete'})
end
