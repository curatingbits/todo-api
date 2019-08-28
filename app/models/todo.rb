class Todo < ApplicationRecord
  belongs_to :project
  after_create :set_completed

  def set_completed
  self.completed = false
end


end
