require 'sinatra/base'
require_relative './lib/bookmarks.rb'

class BookmarksManager < Sinatra::Base
  enable :sessions, :method_override

  before do
    @bookmarks = Bookmark
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/bookmarks' do
    @bookmarks.create(title: params['title'], url: params['url'])
    redirect(:bookmarks)
  end

  delete '/bookmarks/:id' do
    @bookmarks.delete(id: params['id'])
    redirect('/bookmarks')
  end
  
  run! if app_file == $0
end