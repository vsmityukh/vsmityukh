class Project < ApplicationRecord
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

end
