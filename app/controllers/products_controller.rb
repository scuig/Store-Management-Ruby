class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @nombre = 'Productos'
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @nombre = 'Detalles del producto'
  end

  # GET /products/new
  def new
    @nombre = 'Nuevo producto'
    @product = Product.new
    @product.product_categories.build
    @product.categories.build

    @product.product_materials.build
    @product.materials.build
  end

  # GET /products/1/edit
  def edit
    @nombre = 'Editar producto'
    @product= Product.find(params[:id])
    @product.product_materials.build
    @product.materials.build
    @product.product_categories.build
    @product.categories.build
  
  end

  # POST /products
  # POST /products.json
  def create
    @nombre = 'Nuevo producto'
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'El producto fue creado correctamente.' }
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
    @nombre = 'Alterar producto'
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'El producto fue editado correctamente.' }
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
      format.html { redirect_to products_url, notice: 'El producto fue eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(
        :name, :price, :description,
        product_categories_attributes: [:category_id, :_destroy,
          categories_attributes: [:id, :name]],
        product_materials_attributes: [:material_id, :units, :_destroy,
          materials_attributes: [:id, :name, :available]]
        )
    end
end
