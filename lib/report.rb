require 'json'

class Report
  
  attr_accessor :payload, :document_url
  
  def initialize(payload = "")
    if payload.length > 0
      @payload = JSON.parse(payload)
    else
      @payload = nil
    end
  end
  
  def valid_data?
    if @payload != nil
      return true
    else
      return false
    end
  end
  
  def generate_url
    @payload["document_url"] = "http://my.doc.url"
    return
  end
  
end