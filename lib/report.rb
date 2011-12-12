require 'json'

class Report
  
  attr_accessor :payload, :document_url
  
  def initialize(payload = {})
    @payload = payload
  end
  
  def valid_data?
    if payload != ""
      return true
    else
      return false
    end
  end
  
end