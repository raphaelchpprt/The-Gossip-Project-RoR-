class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    @comment = Comment.new(id: Comment.last.id + 1, content: params[:content], user_id: current_user.id, gossip_id: params[:gossip_id])
    if @comment.save
      redirect_to(gossip_path(params[:gossip_id]))
    end
    puts "$"*10
    puts current_user.id
    puts "$"*10
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

  def authenticate_user
    unless current_user
      redirect_to(new_session_path, notice: 'Must be connected')
    end
  end

end