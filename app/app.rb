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
    # @links = Link.all
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

end
