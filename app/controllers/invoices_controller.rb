class InvoicesController < ApplicationController
  layout 'main'
  require 'rexml/document'
  include REXML
  def index
    response_body = my_connection.invoice.list
    @invoices = response_body['invoices']['invoice']
  end
    
  def show
    req_invoice = Invoice.new(my_connection)
    @invoice = req_invoice.show(params[:id])
    @items = []
    @time_entries = []
    lines =  @invoice['lines']['line']
    if lines.is_a?(Hash)
      if lines['type'] == 'Time'
        @items << lines
      else
        @time_entries << lines
      end
    else
      @items =  lines.select {|line| line['type'] == 'Item'}
      @time_entries  =  lines.select {|line| line['type'] == 'Time'}
    end
    #@items=
    #render :xml => @invoice  
  end
  
  def new
    clients_init = Client.new(my_connection)
    @clients = clients_init.list
    invoices_init = Invoice.new(my_connection)
    @invoices = invoices_init.list
    tasks_init = Task.new(my_connection)
    @tasks = tasks_init.list
    # taxes_init = Tax.new(my_connection)
    # @taxes = taxes_init.list
    #render :json => @taxes['tax_id']
    
    
     
    
    #render :text => controller_path 
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def create
    response_body = my_connection.invoice.create(:invoice => {
      :client_id =>  params[:invoice][:client_id],
      :number =>  params[:invoice][:number],
      :status =>  'draft',
      :date =>  params[:invoice][:date],
      :po_number =>  params[:invoice][:po_number],
      :discount =>  params[:invoice][:discount],
      :lines => [{:line =>
                    {
                        :name => params[:invoice][:lines][:name],
                        :description => params[:invoice][:lines][:description],
                        :unit_cost => params[:invoice][:lines][:unit_cost],
                        :quantity => params[:invoice][:lines][:quantity]
                    }
      }]   
    })
    if response_body['invoice_id']
      redirect_to invoices_path
    else
      render :action => 'new'
    end
    #render :json => params[:invoice]
    
  end
end
