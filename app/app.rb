ENV['RACK_ENV'] ||= 'development'

require_relative 'dm_setup'
require 'sinatra/base'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'sexy time'
  register Sinatra::Flash

  get '/' do
    @user_email = session[:user_email]
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
    @current_user = User.create(email: params[:email], password: params[:password],
      password_confirmation: params[:confirmation_password])
    flash[:wrong_password] = "Password and confirmation password do not match" if @current_user.id.nil?
    flash[:repeat_email] = @current_user.errors[:email].join(" ")
    session[:user_email] = @current_user.email
    redirect '/' if @current_user.id.nil?
    redirect '/links'
  end

  # helpers do
  #   def current_user
  #     @current_user ||= session[:user_email]
  #   end
  # end
end
