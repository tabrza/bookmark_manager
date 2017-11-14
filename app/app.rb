ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    'test 123'
  end

  get '/links' do
    @links = Link.all
    @url = session[:url]
    @title = session[:title]
    erb :'links/index'
  end

  post '/add_links' do
    session[:url] = params[:url]
    session[:title] = params[:title]
    Link.create(url: params[:url], title: params[:title])
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

end
