ENV['RACK_ENV'] ||= 'development'

require_relative 'dm_setup'
require 'sinatra/base'

class BookmarkManager < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/links' do
    # @links = Link.all
    # @current_user = session[:current_user]
    @user_email = session[:user_email]
    erb(:'links/index', locals: { links: Link.all })
  end

  post '/add_links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split(',').map(&:strip).each do |t|
      link.tags << Tag.first_or_create(name: t)
    end
    link.save
    redirect '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    # @links = tag ? tag.links : []
    erb(:'links/index', locals: { links: tag ? tag.links : [] })
  end

  post '/sign_up' do
    @current_user = User.new(email: params[:email])
    session[:user_email] = @current_user.email
    p "CURRENT USER",session[:current_user]
    redirect '/links'
  end

end
