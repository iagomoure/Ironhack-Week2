require_relative '../server.rb'
require 'rspec'
require 'rack/test'
require 'pry'

describe 'Server Service' do 
	include Rack::Test::Methods

	def app
		Sinatra::Application
	end

	it "should load the home page" do
		get "/posts_index"
		expect(last_response).to be_ok
	end

	it "should load the posts ordered chronological page" do
		get "/posts_chrono"
		expect(last_response).to be_ok
	end
end