class CatsController < ApplicationController
    before_action :verify_cat_owner, only: [:edit, :update]

    def index
        @cats = Cat.all 
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        @owner_call = (@cat.owner == current_user)
        
        if @cat
            @cat_rental_requests = @cat.cat_rental_requests.order(:start_date)
            render :show   
        else
            redirect_to cats_url
        end
    end

    def new
        @cat = Cat.new
        render :new
    end

    def create

        @cat = Cat.new(cat_params)
        @cat.user_id = current_user.id

        if @cat.save
            flash[:notice] = 'Success!'
            redirect_to cat_url(@cat)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def update  

        if @cat.update_attributes(cat_params)
            flash[:notice] = 'Success!'
            redirect_to cat_url(@cat)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def edit
        render :edit
    end

    private

    def cat_params
        params[:cat].permit(:name, :birth_date, :color, :sex, :description)
    end

    def verify_cat_owner
        @user = current_user
        @cat = @user.find_own_cat(params[:id])
            
        redirect_to user_url(@user) if @cat == nil
    end 

end