json.array!(@comments) do |comment|
  json.extract! comment, :id, :account_id, :article_id, :description
  json.url comment_url(comment, format: :json)
end
