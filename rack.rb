# rack is a ruby gem + an architecture
# rack defines a very simple interface
# rake compliant code must have the following 3 characteristics
# 1 - must respond to call
# 2 - method must accept a single argument - usually env (which bundles the request object)
# 3 - the call method must return an array of 3 elements - [status, headers, body]




# Rack Hello World


require 'rack'
require 'thin'

class HelloWorld
  def call(env)
    # [status, headers, body]
    [200, {'content-type' => 'text/plain'}, ["Hello World"]]
  end
end

# Rack::Handler::Thin::run HelloWorld.new


class HelloWorld
  # exploring the env object
  def call(env)
    [200, {'content-type'=> 'text/plain'} , env]
  end
end


# Rack::Handler::Thin::run HelloWorld.new


# using lambdas instead of a class

# app = -> (env) do
#   [200, {'content-type' => 'text/plain' }, env]
#   end

# Rack::Handler::Thin::run app


# Middleware = are the building blocks of larger applications using rack


# core app sleep for 3 seconds


app = ->(env) do
  sleep 3
  [200, {'content-type'=> 'text/plain'}, ["HelloWorld "]]
end

class Middleware
  def initialize(app)
    @app = app
  end

  def call(env)
    start_time = Time.now.to_i
    status, headers, body = @app.call(env)
    end_time = Time.now.to_i
    logger_message = "Time taken is #{end_time}"
    [status, headers, body << logger_message]
  end
end

Rack::Handler::Thin::run Middleware.new(app)

