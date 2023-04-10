class Todo < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :start, presence: true
  validates :end, presence: true, comparison: { greater_than_or_equal_to: :start }
  validates :progress, presence: true, numericality: { only_integer: true }

  def self.ransackable_attributes(auth_object = nil)
    ["end", "id", "name", "progress", "start"]
  end

  def frappe_json
    new_todo = self.attributes
    new_todo["id"] = frappe_id
    new_todo
  end

  def frappe_id
    "frappe_id-#{id}"
  end
end
