require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarksManager < Sinatra::Base
  before do
    @bookmarks = Bookmarks
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  post '/bookmarks' do
    @bookmarks.create(title: params['title'], url: params['url'])
    redirect(:bookmarks)
  end
  
  run! if app_file == $0
end