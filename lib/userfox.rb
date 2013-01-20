require "httparty"
require "json"
require "userfox/client"

module Userfox
  class << self

    def new(client_id, client_secret)
      Userfox::Client.new(client_id, client_secret)
    end

  end  
end
