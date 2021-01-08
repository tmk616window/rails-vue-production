class Itag < ApplicationRecord
    belongs_to :task, optional: true
end
