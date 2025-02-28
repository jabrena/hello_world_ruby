require 'webrick'

port = ENV.fetch('PORT', 8080) # Usa a porta 8080 se não houver uma variável de ambiente

server = WEBrick::HTTPServer.new(:Port => port.to_i, :DocumentRoot => './')

server.mount_proc '/' do |req, res|
  res.content_type = 'text/html'
  
  html_file_path = 'index.html'
  
  begin
    # Read the file contents
    html_content = File.read(html_file_path)
    res.body = html_content
  rescue Errno::ENOENT
    # Handle file not found error
    res.status = 404
    res.body = '<h1>404 - File Not Found</h1><p>The requested HTML file could not be found.</p>'
  rescue => e
    # Handle other errors
    res.status = 500
    res.body = "<h1>500 - Server Error</h1><p>Error: #{e.message}</p>"
  end
end

trap 'INT' do
  server.shutdown
end

server.start
