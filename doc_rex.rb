#!/usr/bin/env ruby
require 'rubygems'
require 'goliath'

class DocRex < Goliath::API
  
  def response(env)
    [200, {}, "Sup Yo"]
  end
  
  
end
