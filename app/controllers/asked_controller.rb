class AskedController < ApplicationController
  def index
  end
  
  def write
    new_post = Post.new
    new_post.content= params[:content]
    new_post.save
    redirect_to '/list'
  end
  
  def list
    @every_post = Post.all.reverse
  end
  
  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to "/list"
  end
  
  def update_view
    @one_post = Post.find(params[:id])    
  end
  
  def update
    @one_post = Post.find(params[:id])  
    @one_post.content = params[:content]
    @one_post.save
    
    redirect_to '/list'
  end
  
  def reply_write
    reply = Reply.new
    reply.content = params[:content]
    reply.post_id = params[:id_of_post]
    reply.save
    redirect_to "/list"
  end
end
