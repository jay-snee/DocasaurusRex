##!/usr/bin/env ruby
#require 'rubygems'
#require 'goliath'
#
#
class ReceiveData < Goliath::API
  use Goliath::Rack::Params
  
  attr_accessor :data 

  def response(env)
    # Pick up the request body
    @data = env['rack.input'].read
    
    if validate_data(@data)
      [200, {}, "data: #{@data}"]
    else
      [500, {}, "No data"]
    end
  end
  
  def validate_data(data)
    if @data.length > 0
      return true
    else
      return false
    end
  end
  
end
