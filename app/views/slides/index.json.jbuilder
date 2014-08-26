json.array!(@slides) do |slide|
  json.extract! slide, :id, :image_url, :link_url, :order
  json.url slide_url(slide, format: :json)
end
