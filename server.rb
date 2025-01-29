require 'webrick'

server = WEBrick::HTTPServer.new(:Port => 3000)

server.mount_proc '/' do |req, res|
  res.content_type = 'text/html'
  res.body = '<h1>Hello, World!</h1>'
end

trap 'INT' do
  server.shutdown
end

server.start
