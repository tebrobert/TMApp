# ruby encoding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.delete_all
Todo.delete_all

seed_file = Rails.root.join('db', 'seeds', 'seeds.yml')
seed_hash = HashWithIndifferentAccess.new(YAML::load_file(seed_file))

seed_hash["projects"].each do |project_hash|
  project = Project.create title:project_hash["title"]
  project_hash["todos"].each do |todo_hash|
    todo = Todo.create text:todo_hash["text"], isCompleted:todo_hash["isCompleted"]
    project.todos << todo
  end
end
