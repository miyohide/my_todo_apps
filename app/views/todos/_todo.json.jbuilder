json.extract! todo, :id, :name, :start, :end, :progress, :created_at, :updated_at
json.url todo_url(todo, format: :json)
