class ClientsController < ApplicationController
  require "net/http"
  require "uri"
  require 'httparty'
  def index
    response_body = my_connection.client.list
    @clients = response_body['clients']['client']
    render :json => @clients 
    
  end
end
