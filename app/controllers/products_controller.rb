class ProductsController < ApplicationController
  before_action :set_product, only: [:star,:show, :edit, :update, :destroy]
  before_action :current_user, only:[:star]
  LIMITED_PRODUCTS_NUM=10

  # GET /products
  # GET /products.json
  def index
   
    if !params[:category].blank?
      @products = Product.where(["category_id = ? ", params[:category]])
    elsif !params[:provider].blank?
      @products = Product.where(["provider_id = ? ", params[:provider]])
    else
      @products = Product.all      
    end


    if params[:page]
      @page= params[:page].to_i
    else 
      @page = 1
    end

=begin    
    @products=[]
    (1...100).each do |index|
      product ={

        id: index,
        price: 10,
      }
      @products << product
    end
=end


#    @products = Product.all
      @first_page =(@products.count==0)? 0:1
    @last_page=(@products.count / LIMITED_PRODUCTS_NUM)+1

    @products = @products.offset((@page-1) * LIMITED_PRODUCTS_NUM).limit(LIMITED_PRODUCTS_NUM)

  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

     #   @product = @product.merge({image_url: image_url})


    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def star 

    if @current_user.like_product?(@product) == false
      @current_user.like_product(params[:id])
      @favorite_exists = true
    else
      @current_user.unlike_product(params[:id])
  #    @product.likes_count.save(touch: false)
      @favorite_exists = false
    end

  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :category_id,:provider_id,:image_url,:price,  :volume, :favorites,:file)
    end

end
