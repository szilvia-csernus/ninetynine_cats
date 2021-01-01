class UsersController < ApplicationController
    before_action :require_current_user!, except: [:create, :new]
    
    def create
    @user = User.new(user_params)

        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

  def new
    @user = User.new
  end

  def show
    @cats = current_user.cats.includes(:cat_rental_requests)
    @cat_rental_requests = current_user.cat_rental_requests.includes(:cat)
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end