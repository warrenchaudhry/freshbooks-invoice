class MainController < ApplicationController
  require 'net/https'
  require 'rexml/document'
  
  def index
    c = FreshBooks::Client.new('inboxbusinesssolutions.freshbooks.com', 'a329d849b73d1ceb981607a064f2bda5')
    invoice = c.invoice.list
    # doc = REXML::Document.new(clients)
    # root = doc.root
    render :xml => invoice['invoices']['invoice'] 
  end
  
end
