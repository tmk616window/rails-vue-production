json.set! :ptags do
  json.array! @ptag do |ptag|
    json.extract! ptag, :id, :task_id, :tag, :created_at, :updated_at
  end
end
