require 'rack'



app = Proc.new do |env|
  req = Rack::Request.new(env)#creating req objects
  res = Rack::Response.new#creating req objects
  res['Content-Type'] = 'text/html'#tells the browser what the server has given to it in response
  res.write("Hello world!")#actually put things into the response body
  res.finish#call Rack::Response#finish when the res is done being built 
  #so Rack knows to wrap everything up for you
end
Rack::Server.start(
  app: app,
  Port: 3000
)
Rack::Server.start( #using Rack to start a web server
  app: Proc.new do |env| #telling it that the app we are going use is the Proc we are making
    ['200', {'Content-Type' => 'text/html'}, ['hello world']]
  end
)
