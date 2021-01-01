json.set! :tasks do
  json.array! @tasks do |task|
    json.extract! task, :id, :name,:user_id, :created_at, :updated_at
  end
end


