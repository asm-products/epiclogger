json.users @users do |user|
  json.(user, :id, :name, :email, :created_at, :updated_at, :website_id)
end