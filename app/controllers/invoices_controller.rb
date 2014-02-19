class InvoicesController < ApplicationController
  layout 'main'
  require 'rexml/document'
  include REXML
  def index
    response_body = my_connection.invoice.list(:status => 'draft')
    @invoices = response_body['invoices']['invoice']
    
  end
    
  def show
    response_body = my_connection.invoice.get :invoice_id => params[:id]
    render :xml => response_body
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
