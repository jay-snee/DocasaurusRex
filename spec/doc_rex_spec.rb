#!/usr/bin/env ruby
require 'rubygems'
require 'goliath/rack'
require 'goliath/test_helper'

require File.expand_path(File.join(File.dirname(__FILE__), '..', 'doc_rex'))

describe DocRex do
  include Goliath::TestHelper

  let(:err) { Proc.new { |c| fail "Request failed #{c.response}" } }

  it 'lives' do
    with_api(DocRex) do
      get_request({}, err) do |c|
        c.response_header.status.should == 200
      end
    end
  end
end