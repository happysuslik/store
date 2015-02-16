class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  respond_to :html, :xml, :json

  def index
    @line_items = LineItem.all
    respond_with(@line_items)
  end

  def show
    respond_with(@line_item)
  end

  def new
    @line_item = LineItem.new
    respond_with(@line_item)
  end

  def edit
  end

  def create
    book = Book.find(params[:book_id])
    @line_item = @cart.add_book(book, params[:quantity].to_i)

    respond_to do |format|
      if @line_item.save
         @line_item.calc_price
         # посчитали сумму
        format.html {redirect_to @line_item.cart,
            notice: 'Line Item created.'}
        format.json {render action: 'show',
            status: :created, location: @line_item}
      else
        format.html {render action: 'new'}
        format.json {render json: @line_item.errors,
            status: :unprocessable_entity}
      end
    end
  end

  def update
    @line_item.update(line_item_params)
    respond_with(@line_item)
  end

  def destroy
    @line_item.destroy
    redirect_to :back
  end

  private
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    def line_item_params
      params.require(:line_item).permit(:book_id, :cart_id)
    end
end
