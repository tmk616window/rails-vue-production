class Like < ApplicationRecord
    belongs_to :task, optional: true
end
