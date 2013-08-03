require 'faker'
require_relative '../app/models/task.rb'
require_relative '../app/models/list.rb'

5.times do
  List.create({name: Faker::Lorem.word})
end

25.times do
  Task.create({description: Faker::Company.bs, status: 'incomplete', list: List.all.sample})
end

