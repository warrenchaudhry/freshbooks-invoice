class MainController < ApplicationController
  require 'net/https'
  require 'rexml/document'
  
  def index
    
    invoice = my_connection.invoice.list
    # doc = REXML::Document.new(clients)
    # root = doc.root
    render :xml => invoice['invoices']['invoice'] 
  end
  
end
