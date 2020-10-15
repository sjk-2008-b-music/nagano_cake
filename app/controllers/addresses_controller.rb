class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def index
  	@addresses = Address.where(end_user_id: current_end_user.id)
    @address = Address.new
    @end_user = current_end_user
  end

  def edit
  	@address = Address.find(params[:id])
    @end_user = current_end_user
  end

  def create
  	@address = Address.new(address_params)
    @address.end_user_id = current_end_user.id
    @address.save
  	redirect_to addresses_path
  end

  def update
  	@address = Address.find(params[:id])
  	if @address.update(address_params)
      redirect_to addresses_path
    end
  end

  def destroy
  	address = Address.find(params[:id])
  	address.destroy
  	redirect_to addresses_path
  end

   private
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
end