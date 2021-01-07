json.set! :itags do
  json.array! @itag do |itag|
    json.extract! itag, :id, :task_id, :tag, :created_at, :updated_at
  end
end
