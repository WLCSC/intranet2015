json.array!(@notes) do |note|
  json.extract! note, :id, :content, :title, :user_sid, :expires
  json.url note_url(note, format: :json)
end
