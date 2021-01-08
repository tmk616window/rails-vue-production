class Taskcomment < ApplicationRecord
    belongs_to :task, optional: true
end
