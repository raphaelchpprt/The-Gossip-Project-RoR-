class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = Comment.new(id: Comment.last.id + 1, content: params[:content], user_id: 11, gossip_id: params[:gossip_id])
    if @comment.save
      redirect_to(gossip_path(params[:gossip_id]))
    end
  end

end