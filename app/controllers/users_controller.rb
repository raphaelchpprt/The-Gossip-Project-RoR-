class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(id: User.last.id + 1, email: params[:email], password: params[:password], password_confirmation: params[:confirmation], city_id: 1)

    if @user.save
      session[:user_id] = @user.id
      redirect_to(root_path, notice: 'Logged in!')
    else
      render(new_user_path)
    end
  end

end
