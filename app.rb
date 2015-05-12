require 'bundler/setup'
require 'sinatra'
require 'sinatra/json'
require 'faker'

set :server, :puma

get '/users.json' do
  users = 1_000.times.map do
    {
      id: SecureRandom.uuid,
      email: Faker::Internet.email,
      name: Faker::Name.name
    }
  end

  json users
end
