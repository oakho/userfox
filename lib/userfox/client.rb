module Userfox
  class UnauthorizedError < StandardError; end
  class Client
    include HTTParty

    base_uri "https://api.userfox.com/v1"

    def initialize(client_id, client_secret)
      @auth = { username: client_id, password: client_secret }
    end

    def post(path, options = {})
      options.merge!({ basic_auth: @auth })
      handle_response { self.class.post(path, options) }
    end

    def track(email, url, delta = {}, options = {})
      options[:body] = { addr: email, url: url, delta: delta.to_json }

      post("/track.json", options)
    end

    def send(email, name, delta = {}, options = {})
      options[:body] = { addr: email, name: name, delta: delta.to_json }

      post("/send.json", options)
    end

    def change(from, to, options = {})
      options[:body] = { from: from, to: to }

      post("/change.json", options)
    end

    def unsubscribes(email, options = {})
      options[:body] = { addr: email }

      post("/unsubscribes.json", options)
    end

    protected

    def handle_response(&block)
      response = block.call

      case response.code
        when 401 then raise(UnauthorizedError, "You are unauthorized, check your credentials.")
        # At the moment, 404 errors from the API means lots of things...
        when 404 then raise(UnauthorizedError, "You are unauthorized, check your credentials.")  
      end

      response
    end
  end
end
