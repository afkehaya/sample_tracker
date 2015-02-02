json.array!(@samples) do |sample|
  json.extract! sample, :id, :line, :season, :style, :color, :date_out, :to_who, :date_in, :location
  json.url sample_url(sample, format: :json)
end
