class CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    
    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render 'edit'
    end
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    
    redirect_to customers_path
  end
  
  def search
    @search_keyword = search_params[:q]
    
    @customers = if @search_keyword
      Customer.where("lower(name) LIKE ?", "%#{@search_keyword.downcase}%")
    else
      Customer.all
    end
    
    render 'customer_search'
  end
  
  private
  def customer_params
    params.require(:customer).permit(:name, :email, :phone_numer, :profile_pic, :address)
  end
  
  def search_params
    params.require(:customer).permit(:q)
  end
end
