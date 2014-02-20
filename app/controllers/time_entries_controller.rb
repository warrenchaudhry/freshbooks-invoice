class TimeEntriesController < ApplicationController
  
  require "net/http"
  require "uri"
  require 'httparty'
  def index
    token = '8SYEj6qtWPRUgKjqRilzXFMQ3923GNUYlMYiek4P'
    api_url = 'http://www.worksnaps.net/api/projects.xml'
    response = HTTParty.get(api_url, {:basic_auth =>{:token => token}})
    render :xml => response.body 
    # request_tax = my_connection.client.list
    # @clients = response_body['clients']['client'] 
    
  end
end
