class CatRentalRequestsController < ApplicationController
    before_action :verify_cat_owner_for_request, only: [:approve, :deny]

    def index
        @cat = Cat.find_by(id: params[:cat_id])
        @owner_call = (@cat.owner == current_user)
        @cat_rental_requests = @cat.cat_rental_requests.order(:start_date)
        render :index 
    end

    def show
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        @cat = @cat_rental_request.cat
        
        
        if @cat_rental_request
            render :show   
        else
            redirect_to cat_rental_requests_url
        end
    end

    def new
        @cats = Cat.select(:id, :name).all
        @cat_rental_request = CatRentalRequest.new
        render :new
    end

    def create


        @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
        @cat_rental_request.user_id = current_user.id

        if @cat_rental_request.save
            flash[:notice] = 'Success!'
            redirect_to cat_rental_request_url(@cat_rental_request)
        else
            flash.now[:errors] = @cat_rental_request.errors.full_messages
            render :new
        end
    end

    def approve
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat = @cat_rental_request.cat

        if @cat_rental_request.approve!
            #flash[:notice] = 'Success!'
            redirect_to cat_url(cat)
        else
            flash.now[:errors] = @cat_rental_request.errors.full_messages
            render 'approval unsuccessful!'
        end
    end

    def deny

        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        cat = @cat_rental_request.cat

        if @cat_rental_request.deny!
            #flash[:notice] = 'Request successfully denied ;)'
            redirect_to cat_url(cat)
        else
            flash.now[:errors] = @user.errors.full_messages
            render 'denial unsuccessful!'
        end
    end


    private

    def cat_rental_request_params
        params[:cat_rental_request].permit(:cat_id, :start_date, :end_date, :status)
    end

    def verify_cat_owner_for_request
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        @cat = current_user.cats.find_by(id: @cat_rental_request.cat.id)
            
        redirect_to user_url(current_user) if @cat == nil
    end 
end