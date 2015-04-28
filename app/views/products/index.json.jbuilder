json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :weight
  json.url product_url(product, format: :json)
end
