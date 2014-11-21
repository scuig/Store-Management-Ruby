class MaterialPurchasesController < ApplicationController
  before_action :set_material_purchase, only: [:show, :edit, :update, :destroy]

  # GET /material_purchases
  # GET /material_purchases.json
  def index
    @material_purchases = MaterialPurchase.all
  end

  # GET /material_purchases/1
  # GET /material_purchases/1.json
  def show
  end

  # GET /material_purchases/new
  def new
    @material_purchase = MaterialPurchase.new
  end

  # GET /material_purchases/1/edit
  def edit
  end

  # POST /material_purchases
  # POST /material_purchases.json
  def create
    @material_purchase = MaterialPurchase.new(material_purchase_params)

    respond_to do |format|
      if @material_purchase.save
        format.html { redirect_to @material_purchase, notice: 'Material purchase was successfully created.' }
        format.json { render :show, status: :created, location: @material_purchase }
      else
        format.html { render :new }
        format.json { render json: @material_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /material_purchases/1
  # PATCH/PUT /material_purchases/1.json
  def update
    respond_to do |format|
      if @material_purchase.update(material_purchase_params)
        format.html { redirect_to @material_purchase, notice: 'Material purchase was successfully updated.' }
        format.json { render :show, status: :ok, location: @material_purchase }
      else
        format.html { render :edit }
        format.json { render json: @material_purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_purchases/1
  # DELETE /material_purchases/1.json
  def destroy
    @material_purchase.destroy
    respond_to do |format|
      format.html { redirect_to material_purchases_url, notice: 'Material purchase was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material_purchase
      @material_purchase = MaterialPurchase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_purchase_params
      params.require(:material_purchase).permit(:units, :exp_date, :amount)
    end
end
