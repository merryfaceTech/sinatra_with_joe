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
      expect(last_response.body).to eq('Hello world!')
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
      expect(last_response.body).to eq('llamas everywhere!')
    end
  end
end