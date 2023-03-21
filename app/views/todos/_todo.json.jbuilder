json.id "frappe-gantt_#{todo.id}"
json.extract! todo, :name, :start, :end, :progress, :created_at, :updated_at
json.url todo_url(todo, format: :json)
