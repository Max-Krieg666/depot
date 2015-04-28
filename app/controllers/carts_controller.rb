class CartsController < ApplicationController

  # GET /carts
  # GET /carts.json
  def index
    respond_to(&:js)
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @cart, notice: 'Корзина создана.'
    else
      render :new
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    if @cart.update(cart_params)
      redirect_to @cart, notice: 'Корзина изменена.'
    else
      render :edit
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy if @cart.id==session[:cart_id]
    session[:cart_id]=nil
    redirect_to root_path, notice: 'Корзина очищена.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params[:cart]
    end
end
