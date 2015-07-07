json.array!(@references) do |reference|
  json.extract! reference, :id, :title, :url, :username, :password, :external, :notes
  json.url reference_url(reference, format: :json)
end
