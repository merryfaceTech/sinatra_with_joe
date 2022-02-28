require "spec_helper"
require_relative "../myapp.rb"
require 'rspec'
require 'rack/test'

describe App do
  include Rack::Test::Methods
  let(:app) { App.new }

  context "GET to /" do
    let(:response) { get "/" }

    it "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    it "says hello world in the index page" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('<h1>Hello world!</h1>')
    end
  end

  context "GET to /" do
    let(:response) { get "/llama-page" }

    it "returns status 200 OK" do
      expect(response.status).to eq 200
    end

    it "says hello world in the index page" do
      get '/llama-page'
      expect(last_response).to be_ok
      expect(last_response.body).to include('Llamas everywhere!')

      img_url = /src\s*=\s*"([^"]*)"/.match(last_response.body)
      if img_url
        img_url = img_url[1]
      end
      puts img_url, "<----------"

      # get img_url
      get 'https://images.theconversation.com/files/337593/original/file-20200526-106811-ql6d51.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1356&h=668&fit=crop'
      puts last_response
      expect(last_response.status).to eq 200
    end
  end
end