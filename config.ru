require 'rack'
require 'rack/static'

# Serve static files from the project root
use Rack::Static,
  :urls => ["/lib", "/spec", "/node_modules"],
  :root => File.dirname(__FILE__)

# Handle the root path
map "/" do
  run lambda { |env|
    if env["PATH_INFO"] == "/"
      # Redirect to test runner
      [302, {"Location" => "/spec/test_runner.html"}, []]
    elsif env["PATH_INFO"] == "/test" || env["PATH_INFO"] == "/tests"
      # Also redirect /test to test runner
      [302, {"Location" => "/spec/test_runner.html"}, []]
    else
      [404, {"Content-Type" => "text/plain"}, ["Not Found"]]
    end
  }
end