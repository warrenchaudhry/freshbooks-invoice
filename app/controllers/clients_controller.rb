class ClientsController < ApplicationController
  
  def index
    response_body = my_connection.client.list
    @clients = response_body['clients']['client'] 
    
  end
end
