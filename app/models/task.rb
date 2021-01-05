class Task < ApplicationRecord
    belongs_to :user, optional: true
    has_many :ptags,foreign_key: 'task_id', dependent: :destroy
end
