json.array!(@reports) do |report|
  json.extract! report, :id, :title, :body, :slug
  json.url report_url(report, format: :json)
end
