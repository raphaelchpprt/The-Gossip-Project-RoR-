class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(id: Gossip.last.id + 1, title: params[:title], content: params[:content], user_id: 11) # avec xxx qui sont les données obtenues à partir du formulaire

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
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:title], content: params[:content])
      redirect_to(root_path, notice: 'Gossip modified!')
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to(root_path, notice: 'Gossip destroyed!')
  end

end
