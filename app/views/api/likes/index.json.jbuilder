json.set! :likes do
  json.array! @likes do |like|
    json.extract! like, :id, :task_id, :user_id, :created_at, :updated_at
  end
end