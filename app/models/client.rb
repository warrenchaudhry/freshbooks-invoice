class Client
  
  def initialize(connection)
    @connection = connection
  end
  
  def list
    request_client = @connection.client.list
    @clients = request_client['clients']['client'] 
  end
  
  def show(client_id)
    client = @connection.client.get :client_id => client_id
  end
  
  
end