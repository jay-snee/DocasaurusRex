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
        c.response_header.status.should == 404
        c.response.should == "Nothing mapped to root"
      end
    end
  end
  
  it 'responds on /receive_data' do
    with_api(DocRex) do
      post_request({:body => "some data", :path => "/receive_data"}, err) do |c|
        c.response_header.status.should == 200
      end
    end
  end
  
  it 'returns data from /receive_data' do
    with_api(DocRex) do
      post_request({:body => "jimbob", :path => "/receive_data"}, err) do |c|
        c.response.should == "data: jimbob"
      end
    end
  end
  
  it 'should fail /receive_data if no data is sent' do
    with_api(DocRex) do
      post_request({:path => "/receive_data"}, err) do |c|
        c.response_header.status.should == 500
      end
    end
  end
  
end