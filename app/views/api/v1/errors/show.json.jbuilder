json.(@error, :id, :description, :created_at, :updated_at, :website_id, :page_title, :occurrences, :last_occurrence)
json.subscribers @error.subscribers
json.subscribers_count @error.subscribers.count