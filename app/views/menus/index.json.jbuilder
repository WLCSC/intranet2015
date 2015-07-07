json.array!(@menus) do |menu|
  json.extract! menu, :id, :title, :url, :menu_id
  json.url menu_url(menu, format: :json)
end
