class LeasesController < ApplicationController
    before_action :set_lease, only: [:destroy]
  
    # POST /leases
    def create
      lease = Lease.new(lease_params)
  
      if lease.save
        render json: lease, status: :created
      else
        render json: lease.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /leases/1
    def destroy
      @lease.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_lease
      @lease = Lease.find(params[:id])
    end
  
    # Only allow a trusted parameter "white list" through.
    def lease_params
      params.require(:lease).permit(:rent, :apartment_id, :tenant_id)
    end
  end
  