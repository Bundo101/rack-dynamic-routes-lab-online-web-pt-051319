class Application
  
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/) 
      item_name = req.path.split("/items/").last
      item = @@items.find { |item| item.name == item_name }
      unless item
        resp.write "Item not found"
        resp.status = 400
        resp.write "#{item.price}"
    else
      resp.write "Route not found"
      resp.status = 404
    end
  end
  
end