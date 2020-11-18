class Project < ApplicationRecord
  has_many :task, dependent: :destroy
end
