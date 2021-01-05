class Ptag < ApplicationRecord
    belongs_to :task, optional: true
end
