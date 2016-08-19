json.array!(@viewers) do |viewer|
  json.extract! viewer, :id, :id_session, :visits, :user_agent, :ip_client
  json.url viewer_url(viewer, format: :json)
end
