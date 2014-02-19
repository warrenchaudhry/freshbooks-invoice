class InvoicesController < ApplicationController
  layout 'main'
  require 'rexml/document'
  include REXML
  def index
    response_body = my_connection.invoice.list
    @invoices = response_body['invoices']['invoice']
  end
    
  def show
    
  end
  
  def new
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def create
    
  end
end
