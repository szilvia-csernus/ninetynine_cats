class SessionsController < ApplicationController
  

  def new
    before_action redirect_to cats_url if current_user
    
    render :new
  end
  
  def create
    @user = User.find_by_credentials(
        params[:user][:username],
        params[:user][:password])

    if @user.nil?
        # bad password or username
        flash.now[:notices] ||= []
        flash.now[:notices] << "Username or password incorrect."

        render :new
        return
    
    else
        login!(@user)
        redirect_to user_url(@user)

    end
  end

  def destroy
    
    logout!

    flash[:notices] ||= []
    flash[:notices] << "You logged out. See you soon!"

    redirect_to cats_url
  end


end