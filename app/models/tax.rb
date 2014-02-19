class Tax
    
  def initialize(connection)
    @connection = connection
  end
  
  def list
    request_tax = @connection.tax.list
    taxes = request_tax['taxes']['tax'] 
  end
  
  def show(tax_id)
    taxes = @connection.tax.get :tax_id => tax_id
  end
  
  
end