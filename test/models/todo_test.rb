require "test_helper"

class TodoTest < ActiveSupport::TestCase
  test '値が妥当な場合は保存できること' do
    t = Todo.new(name: 'task1', start: Date.today, end: Date.today + 1, progress: 10)
    assert t.save
  end

  test 'nameが入力されていないときには、保存できないこと' do
    t = Todo.new(start: Date.today, end: Date.today + 1, progress: 10)
    assert_not t.save
  end

  test 'nameが101文字以上入力されていないときには、保存できないこと' do
    t = Todo.new(name: 'a'*101, start: Date.today, end: Date.today + 1, progress: 10)
    assert_not t.save
  end

  test '開始日付が入力されていない時には、保存ができないこと' do
    t = Todo.new(name: 'task1', end: Date.today + 1, progress: 10)
    assert_not t.save
  end

  test '開始日付が日付として不正な場合には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: '2023-04-32', end: Date.today + 1, progress: 10)
    assert_not t.save
  end

  test '終了日付が入力されていない時には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Date.today, progress: 10)
    assert_not t.save
  end

  test '終了日付が日付として不正な場合には、保存ができないこと' do
    t = Todo.new(name: 'task1', start: Date.today, end: '2023-05-32', progress: 10)
    assert_not t.save
  end
end
