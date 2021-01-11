class Task < ApplicationRecord
    belongs_to :user, optional: true
    has_many :ptags,foreign_key: 'task_id', dependent: :destroy
    has_many :itags,foreign_key: 'task_id', dependent: :destroy
    has_many :taskcomments,foreign_key: 'task_id', dependent: :destroy
    has_many :likes,foreign_key: 'task_id', dependent: :destroy
end
