class ApartmentsController < ApplicationController
    before_action :set_apartment, only: [:show, :update, :destroy]
  
    # GET /apartments
    def index
      apartments = Apartment.all
      render json: apartments
    end
  
    # GET /apartments/1
    def show
      render json: @apartment
    end
  
    # POST /apartments
    def create
      apartment = Apartment.new(apartment_params)
  
      if apartment.save
        render json: apartment, status: :created
      else
        render json: apartment.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /apartments/1
    def update
      if @apartment.update(apartment_params)
        render json: @apartment
      else
        render json: @apartment.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /apartments/1
    def destroy
      @apartment.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def apartment_params
      params.require(:apartment).permit(:number)
    end
  end
  