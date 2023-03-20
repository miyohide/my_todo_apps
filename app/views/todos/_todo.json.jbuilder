json.id todo.name
json.extract! todo, :name, :start, :end, :progress, :created_at, :updated_at
json.url todo_url(todo, format: :json)
