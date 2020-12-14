class CatRentalRequestsController < ApplicationController

    def index
        @cat = Cat.find_by(id: params[:cat_id])
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

        if @cat_rental_request.save
            flash[:notice] = 'Success!'
            redirect_to cat_rental_request_url(@cat_rental_request)
        else
            #flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def approve
        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])

        if @cat_rental_request.approve!
            flash[:notice] = 'Success!'
            redirect_to cat_rental_request_url(@cat_rental_request)
        else
            #flash.now[:errors] = @user.errors.full_messages
            render 'approve unsuccessful!'
        end
    end

    def deny

        @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
        
        if @cat_rental_request.deny!
            flash[:notice] = 'Request successfully denied ;)'
            redirect_to cat_rental_request_url(@cat_rental_request)
        else
            #flash.now[:errors] = @user.errors.full_messages
            render 'denial unsuccessful!'
        end
    end


    private

    def cat_rental_request_params
        params[:cat_rental_request].permit(:cat_id, :start_date, :end_date, :status)
    end
end