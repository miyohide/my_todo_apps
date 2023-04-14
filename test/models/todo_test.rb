require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  test '値が妥当な場合は保存できること' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: 10)
    assert t.save
  end

  test 'nameが入力されていないときには、保存できないこと' do
    t = Todo.new(start: Time.zone.today, end: Time.zone.today + 1, progress: 10)
    assert_not t.save
  end

  test 'nameが101文字以上入力されていないときには、保存できないこと' do
    t = Todo.new(name: 'a' * 101, start: Time.zone.today, end: Time.zone.today + 1, progress: 10)
    assert_not t.save
  end

  test '開始日付が入力されていない時には、保存ができないこと' do
    t = Todo.new(name: 'task1', end: Time.zone.today + 1, progress: 10)
    assert_not t.save
  end

  test '開始日付が日付として不正な場合には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: '2023-04-32', end: Time.zone.today + 1, progress: 10)
    assert_not t.save
  end

  test '終了日付が入力されていない時には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Time.zone.today, progress: 10)
    assert_not t.save
  end

  test '終了日付が日付として不正な場合には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: '2023-05-32', progress: 10)
    assert_not t.save
  end

  test '進捗が入力されていないとき、保存ができ、デフォルト値として0が入ること' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1)
    assert t.save
    assert_equal 0, t.progress
  end

  test '進捗が数値でないとき、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: 'aaa')
    assert_not t.save
  end

  test '進捗が整数でないとき、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: 3.4)
    assert_not t.save
  end

  test '進捗が負の数であるとき、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: -10)
    assert_not t.save
  end

  test 'frappe_gantt_id はfrappe gantt用のIDを返すこと（数値では不具合が生じるため）' do
    t = Todo.create(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: 10)
    assert_equal "frappe_gantt_id-#{t.id}", t.frappe_gantt_id
  end

  test 'frappe_gantt_todo はfrappe gantt用のTodoデータを返すこと' do
    t = Todo.create(name: 'task1', start: Time.zone.today, end: Time.zone.today + 1, progress: 10)
    fgt = t.frappe_gantt_todo
    # idは変わっていること
    assert_equal "frappe_gantt_id-#{t.id}", fgt['id']
    # 他の項目は変更が入っていないこと
    assert_equal t.name, fgt['name']
    assert_equal t.start, fgt['start']
    assert_equal t.end, fgt['end']
    assert_equal t.progress, fgt['progress']
  end
end
