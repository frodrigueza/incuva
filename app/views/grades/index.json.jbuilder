json.array!(@grades) do |grade|
  json.extract! grade, :id, :level
  json.url grade_url(grade, format: :json)
end
