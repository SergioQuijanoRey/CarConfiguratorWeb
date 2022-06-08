json.extract! modelo, :id, :nombre, :precio, :created_at, :updated_at
json.url modelo_url(modelo, format: :json)
