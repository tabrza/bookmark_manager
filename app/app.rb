ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'dm_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    'test 123'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/add_links' do
    link = Link.create(url: params[:url], title: params[:title])
    tag = params[:tag]
    link.tags << Tag.first_or_create(name: tag)
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

end
