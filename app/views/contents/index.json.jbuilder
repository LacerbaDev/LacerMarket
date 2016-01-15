json.array!(@contents) do |content|
  json.extract! content, :id, :titolo, :descrizione, :price
  json.url content_url(content, format: :json)
end
