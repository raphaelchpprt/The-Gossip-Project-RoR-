class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :show]

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(id: Gossip.last.id + 1, title: params[:title], content: params[:content], user_id: current_user.id) # avec xxx qui sont les données obtenues à partir du formulaire

    if @gossip.save # essaie de sauvegarder en base @gossip
      redirect_to(root_path, notice: 'Gossip saved!')
    else
      render(new_gossip_path)
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = @gossip.comments
  end

  def edit
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      @gossip = Gossip.find(params[:id])
    else
      redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
    end
  end

  def update
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      if @gossip.update(title: params[:title], content: params[:content])
        redirect_to(root_path, notice: 'Gossip modified!')
      else
        render :edit
      end
    else
      redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if current_user.id == @gossip.user.id
      @gossip.destroy
      redirect_to(root_path, notice: 'Gossip destroyed!')
    else
      redirect_to(gossip_path(params[:gossip_id]), notice: "Must be creator")
    end
  end

  def authenticate_user
    unless current_user
      redirect_to(new_session_path, notice: 'Must be connected')
    end
  end

end
