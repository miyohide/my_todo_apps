require 'test_helper'

class TodosHelperTest < ActionView::TestCase
  test 'todo_json_for_gantt はidがfrappe-gantt用のTodoのJSON文字列を返すこと' do
    t1 = todos(:one)
    t2 = todos(:two)
    json_obj = JSON.parse(todo_json_for_gantt([t1, t2]))

    assert_equal "frappe_gantt_id-#{t1.id}", json_obj[0]['id']
    assert_equal t1.name, json_obj[0]['name']
    assert_equal "frappe_gantt_id-#{t2.id}", json_obj[1]['id']
    assert_equal t2.name, json_obj[1]['name']
  end
end
