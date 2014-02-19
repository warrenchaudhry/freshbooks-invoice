class Invoice
  
  attr_accessor :invoice_id  
  def initialize(connection, *args)
    @connection = connection
  end
  
  def list
    request_invoices = @connection.invoice.list
    @clients = request_invoices['invoices']['invoice'] 
  end
  
  def show(invoice_id)
    invoice = @connection.invoice.get :invoice_id => invoice_id
  end
  
  def create
    request_invoices = @connection.invoice.list
  end
end