class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :update]

  respond_to :html

  def index

  end

  def show
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.save
    respond_with(@cart)
  end

  def update
    @cart.update(cart_params)
    respond_with(@cart)
  end

  private

    def set_cart
      @cart = Cart.find(params[:id])
    end

    def cart_params
      params[:cart]
    end
end
