class Task < ApplicationRecord
  belongs_to :project
  acts_as_list scope: :project, add_new_at: :bottom
end
