json.array!(@accounts) do |account|
  json.extract! account, :id, :fullname, :address, :phone
  json.url account_url(account, format: :json)
end
