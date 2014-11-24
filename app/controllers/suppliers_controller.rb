class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET /suppliers
  # GET /suppliers.json
  def index
    @suppliers = Supplier.all
    @nombre = 'Proveedores'
  end

  # GET /suppliers/1
  # GET /suppliers/1.json
  def show
    @nombre = 'Detalles del proveedor'
  end

  # GET /suppliers/new
  def new
    @nombre = 'Nuevo proveedor'
    @supplier = Supplier.new
  end

  # GET /suppliers/1/edit
  def edit
    @nombre = 'Editar proveedor'
  end

  # POST /suppliers
  # POST /suppliers.json
  def create
    @nombre = 'Nuevo proveedor'
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to @supplier, notice: 'El proveedor fue creado correctamente.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suppliers/1
  # PATCH/PUT /suppliers/1.json
  def update
    @nombre = 'Editar proveedor'
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to @supplier, notice: 'El proveedor fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suppliers/1
  # DELETE /suppliers/1.json
  def destroy
    @nombre = 'Eliminar proveedor'
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'El proveedor se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name, :address, :email, :phone)
    end
end
