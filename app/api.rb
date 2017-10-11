require 'bundler/setup'
require 'sinatra/base'
require 'json'

class Api < Sinatra::Base

	get '/hello' do
		'Hello world!'
	end

  get '/movies' do
    content_type :json
    a = JSON.parse(File.read('data.json'))
    a.fetch("movies").to_json
  end

  get '/movies/:data' do
    content_type :json
    a = JSON.parse(File.read('data.json'))
    b = a.fetch("movies")
    b.select { |nb| nb["id"] == params[:data].to_i }.to_json
  end


end
