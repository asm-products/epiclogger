json.websites @websites do |website|
  json.(website, :id, :title, :domain)
end