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
  
  ########
  # receive_data specs - this api should receive data and act on it accordingly
  ########
  
  # Sample document structure
  payload = {
    :document_url => "",
    :title => "My Title",
    :section => {
      :section_title => "Section Title",
      :section_body => "body"
    }
  }.to_json

  it 'responds on /receive_data' do
    with_api(DocRex) do
      post_request({:body => payload, :path => "/receive_data"}, err) do |c|
        c.response_header.status.should == 200
      end
    end
  end
  
  it 'returns data from /receive_data' do
    with_api(DocRex) do
      post_request({:body => payload, :path => "/receive_data"}, err) do |c|
        resp = JSON.parse(c.response)
        resp["title"].should == "My Title"
      end
    end
  end
  
  it 'fails /receive_data if no data is sent' do
    with_api(DocRex) do
      post_request({:path => "/receive_data"}, err) do |c|
        c.response_header.status.should == 500
        c.response.should == "No data"
      end
    end
  end
  
  it 'has a document_url in the response' do
    with_api(DocRex) do
      post_request({:path => "/receive_data", :body => payload}, err) do |c|
        resp = JSON.parse(c.response)
        resp["document_url"].should == "http://my.doc.url"
        resp["document_url"].length.should > 0
      end
    end
  end
  
  
end