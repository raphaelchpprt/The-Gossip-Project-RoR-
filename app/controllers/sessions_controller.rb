class SessionsController < ApplicationController

  def new
    user = User.new
  end

  def create
      # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in!"
    else
      redirect_to new_session_path, notice: "Not logged in!"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to :root, notice: "Logged out!"
  end

end
