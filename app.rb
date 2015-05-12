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

get '/users.json' do
  users = 1_000.times.map { random_user }

  json users
end

get '/users/:id.json' do
  json random_user(params[:id])
end
