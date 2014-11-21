class ProductMaterialsController < ApplicationController
  before_action :set_product_material, only: [:show, :edit, :update, :destroy]

  # GET /product_materials
  # GET /product_materials.json
  def index
    @product_materials = ProductMaterial.all
  end

  # GET /product_materials/1
  # GET /product_materials/1.json
  def show
  end

  # GET /product_materials/new
  def new
    @product_material = ProductMaterial.new
  end

  # GET /product_materials/1/edit
  def edit
  end

  # POST /product_materials
  # POST /product_materials.json
  def create
    @product_material = ProductMaterial.new(product_material_params)

    respond_to do |format|
      if @product_material.save
        format.html { redirect_to @product_material, notice: 'Product material was successfully created.' }
        format.json { render :show, status: :created, location: @product_material }
      else
        format.html { render :new }
        format.json { render json: @product_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_materials/1
  # PATCH/PUT /product_materials/1.json
  def update
    respond_to do |format|
      if @product_material.update(product_material_params)
        format.html { redirect_to @product_material, notice: 'Product material was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_material }
      else
        format.html { render :edit }
        format.json { render json: @product_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_materials/1
  # DELETE /product_materials/1.json
  def destroy
    @product_material.destroy
    respond_to do |format|
      format.html { redirect_to product_materials_url, notice: 'Product material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_material
      @product_material = ProductMaterial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_material_params
      params.require(:product_material).permit(:units)
    end
end
