require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/bookmarks.rb'
require_relative './lib/comment.rb'
require_relative './lib/tag.rb'
require_relative './lib/bookmark_tag.rb'
require_relative './database_connection_setup.rb'

class BookmarksManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  before do
    @bookmarks = Bookmark
  end

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @user = User.find(id: session[:user_id])
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  post '/bookmarks' do
    bookmark = @bookmarks.create(title: params['title'], url: params['url'])
    flash[:notice] = "You must submit a valid URL." if bookmark.nil?
    redirect('/bookmarks')
  end

  delete '/bookmarks/:id' do
    @bookmarks.delete(id: params['id'])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/edit' do
    @bookmark = @bookmarks.find(id: params['id'])
    erb(:edit)
  end

  patch '/bookmarks/:id' do
    @bookmarks.update(id: params['id'], title: params['title'], url: params['url'])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/comments/new' do
    @bookmark = @bookmarks.find(id: params['id'])
    erb(:new_comments)
  end

  post '/bookmarks/:id/comments' do
    Comment.create(text: params['comment'], bookmark_id: params['id'])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/tags/new' do
    @bookmark = @bookmarks.find(id: params['id'])
    erb(:new_tag)
  end

  post '/bookmarks/:id/tags' do
    tag = Tag.create(content: params['tag'])
    BookmarkTag.create(tag_id: tag.id, bookmark_id: params['id'])
    redirect('/bookmarks')
  end

  get '/tags/:tag_id/bookmarks' do
    @tag = Tag.find(tag_id: params['tag_id'])
    erb(:tag_bookmarks)
  end

  get '/users/new' do
    erb(:new_user)
  end

  post '/users' do
    user = User.create(
      name: params['username'], 
      email: params['email'], 
      password: params['password']
    )

    session[:user_id] = user.id
    redirect('/bookmarks')
  end
  
  run! if app_file == $0
end