class InvoicesController < ApplicationController
  layout 'main'
  require 'rexml/document'
  include REXML
  def index
    response_body = my_connection.invoice.list
    @invoices = response_body['invoices']['invoice']
    
  end
    
  def show
    response_body = my_connection.invoice.get :invoice_id => params[:id]
    render :xml => response_body
  end
  
  def new
    request_clients = my_connection.client.list
    request_invoice_list = my_connection.invoice.list
    request_tasks_list = my_connection.task.list
    request_taxes_list = my_connection.tax.list
    @invoices = request_invoice_list['invoices']['invoice']
    @clients = request_clients['clients']['client']
    @tasks = request_tasks_list['tasks']['task']
    @taxes = request_taxes_list['taxes']['tax'] 
    #render :xml => @tasks
    #render :text => controller_path 
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def create
    render :json => params['invoice']
  end
end
