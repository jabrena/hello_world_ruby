require 'webrick'

port = ENV.fetch('PORT', 8080) # Usa a porta 8080 se não houver uma variável de ambiente

server = WEBrick::HTTPServer.new(:Port => port.to_i, :DocumentRoot => './')

server.mount_proc '/' do |req, res|
  res.content_type = 'text/html'
  res.body = '<h1>Hello, World!</h1>'
end

trap 'INT' do
  server.shutdown
end

server.start
