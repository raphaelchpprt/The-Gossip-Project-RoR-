class DynamicPagesController < ApplicationController
  def welcome
  end

  def home
    @gossips = Gossip.all
  end

  def gossip_show
    @gossip = Gossip.find(params[:id])
  end

  def user_show
    @user = User.find(params[:id])
  end
end
