require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base
  get '/' do
     redirect to('/links')
   end

  get '/links' do
    @links = Link.all
    @tag = Tag.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.create(:title => params[:title], :url => params[:url])
    tag = Tag.first_or_create(:tag => params[:tag])
    link.tags << tag
    link.save
    redirect to('/links')
  end

  post '/tags' do
    tag = params[:tag]
    redirect to("/tags/#{tag}")
  end

  get '/tags/bubbles' do
    tags = Tag.all
    p tags
    bubbles = tags.select { |t| t.tag == "bubbles" }
    @links = bubbles[0].links
    p @links
    erb :'/tags/bubbles'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
