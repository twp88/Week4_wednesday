ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require_relative 'models/link'
require_relative 'models/user_deets'



class BookmarkManager < Sinatra::Base
  enable :sessions

  helpers do
    def current_user
      @current_user ||= User_deets.get(session[:user_id])
    end
  end

  post '/signup' do
    @user = User_deets.first_or_create(:user_name => params[:user_name], :email => params[:email], :password => params[:password])
    session[:user_id] = @user.id
    @user.save

    redirect to('/links')
  end


  get '/' do
     erb :'signup/signup'
  end

  get '/links' do
    @user_email = User_deets.all
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
