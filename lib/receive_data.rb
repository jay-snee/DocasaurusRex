##!/usr/bin/env ruby

########################################
# ReceiveData Goliath API
# Handles the collection of data and manufacture of 
# Report objects
########################################


class ReceiveData < Goliath::API
  use Goliath::Rack::Params
  
  attr_accessor :payload 

  def response(env)
    report = Report.new(env['rack.input'].read)
    if report.valid_data?
      report.generate_url
      [200, {}, "#{report.payload.to_json}"]
    else
      [500, {}, "No data"]
    end
  end

end
