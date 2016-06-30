require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  # CREATE, new, COMPLETE
  get '/posts/new' do 
    erb :new
  end

  # CREATE, create, COMPLETE
  post '/posts' do
    @post = Post.create(name: params[:name], content: params[:content])
    redirect get '/posts'
  end

  # UPDATE, update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  # UPDATE
  patch '/posts/:id' do
    Post.update(params[:id], name: params[:name], content: params[:name])
    redirect get '/posts/:id'
  end

  # READ, show
  get '/posts/:id' do 
    @post = Post.find(params[:id])
    erb :show
  end

  # READ, index
  get '/posts' do 
    @posts = Post.all
    erb :index
  end

  # DELETE
  delete '/posts/:id/delete' do
    @post_name = Post.find(params[:id]).name
    Post.delete(params[:id])
    erb :deleted
  end
end