json.errors @errors do |error|
  json.(error, :id, :description, :created_at, :updated_at, :website_id)
end