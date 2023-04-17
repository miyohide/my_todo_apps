# TodosHelper はTodo viewに対するHelperメソッドを持つmodule
module TodosHelper
  # todo_json_for_gantt はFrappe-Gantt向けのJSONデータを生成する
  # Helperメソッド
  def todo_json_for_gantt(todos)
    todos.map(&:frappe_gantt_todo).to_json
  end
end
