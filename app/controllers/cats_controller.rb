class CatsController < ApplicationController

    def index
        @cats = Cat.all 
        render :index
    end

    def show
        @cat = Cat.find_by(id: params[:id])
        
        if @cat
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

        if @cat.save
            flash[:notice] = 'Success!'
            redirect_to cat_url(@cat)
        else
            #flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def update

        @cat = Cat.find_by(id: params[:id])

        if @cat.update_attributes(cat_params)
            flash[:notice] = 'Success!'
            redirect_to cat_url(@cat)
        else
            #flash.now[:errors] = @user.errors.full_messages
            render :edit
        end
    end

    def edit
        @cat = Cat.find_by(id: params[:id])
        render :edit
    end

    private

    def cat_params
        params[:cat].permit(:name, :birth_date, :color, :sex, :description)
    end
end