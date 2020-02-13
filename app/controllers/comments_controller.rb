class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(id: Comment.last.id + 1, content: params[:content], user_id: 11, gossip_id: params[:gossip_id])
    if @comment.save
      redirect_to(gossip_path(params[:gossip_id]))
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      redirect_to(gossip_path(params[:gossip_id]), notice: 'Comment modified!')
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to(gossip_path(params[:gossip_id]), notice: 'Comment destroyed!')
  end


end