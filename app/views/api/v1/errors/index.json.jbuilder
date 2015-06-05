json.errors @errors do |error|
  json.(error, :id, :description, :created_at, :updated_at, :website_id, :page_title, :occurrences, :last_occurrence)
  json.users_count error.subscribers.count
end