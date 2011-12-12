#!/usr/bin/env ruby
require 'rubygems'
require 'goliath'
require 'em-http'
require 'em-synchrony/em-http'

Dir[File.expand_path(File.join(File.dirname(__FILE__), "lib/*.rb"))].each {|file| require file }

class DocRex < Goliath::API
  use ::Rack::Reloader, 0 
  
  post "/receive_data", ReceiveData
  
  not_found('/') do
    run Proc.new { |env| [404, {"Content-Type" => "text/html"}, ["Nothing mapped to root"]] }
  end

end
