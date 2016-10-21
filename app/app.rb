ENV['RACK_ENV'] = 'development'
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
    params[:tag].split.each do |tag|
      link.tags << Tag.first_or_create(tag: tag)
    end

    #link.tags << tag
    link.save
    redirect to('/links')
  end

  get '/tags/:name' do
    tags = Tag.all
    filtered_tags = tags.select { |t| t.tag == params[:tag] }
    p filtered_tags[0]
    @links = filtered_tags[0].links
    p @links

    erb :'/tags/filtered_links'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
