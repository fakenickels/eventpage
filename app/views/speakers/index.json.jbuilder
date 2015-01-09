json.array!(@speakers) do |speaker|
  json.extract! speaker, :id, :bio, :description, :user_id
  json.url speaker_url(speaker, format: :json)
end
