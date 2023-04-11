module TodosHelper
  def todo_json_for_gantt(todos)
    todos.map { |t| t.frappe_gantt_todo }.to_json
  end
end
