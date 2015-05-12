require 'bundler/setup'
require 'sinatra'
require 'sinatra/json'
require 'faker'
require 'oj'
require 'securerandom'

set :server, :puma

helpers do
  def random_user(id = SecureRandom.uuid)
    {
      id: id,
      email: Faker::Internet.email,
      name: Faker::Name.name
    }
  end
end

get '/users' do
  users = 100.times.map { random_user }

  json users
end

get '/users/:id' do
  json random_user(params[:id])
end
