class Todo < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["end", "id", "name", "progress", "start"]
  end
end
