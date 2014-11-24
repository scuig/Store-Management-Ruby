class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  # GET /materials
  # GET /materials.json
  def index
    @materials = Material.all
    @nombre = 'Inventario'

    @materials = Material.order(:name)
    respond_to do |format|
      format.html
      format.csv { send_data @materials.to_csv }

    end

    g = Gruff::Bar.new('500x300')


    lista = Material.order("available ASC")

    if (lista[3] != nil) 

    first = lista[0]
    firstname = first.read_attribute 'name'
    firstname += " (#{first.unit.abbr})"
    first = first.read_attribute 'available'
    first = first.to_int()

    second = lista[1]
    secondname = second.read_attribute 'name'
    secondname += " (#{second.unit.abbr})"
    second = second.read_attribute 'available'
    second = second.to_int()

    third = lista[2]
    thirdname = third.read_attribute 'name'
    thirdname += " (#{third.unit.abbr})"
    third = third.read_attribute 'available'
    third = third.to_int()

    fourth = lista[3]
    fourthname = fourth.read_attribute 'name'
    fourthname += " (#{fourth.unit.abbr})"
    fourth = fourth.read_attribute 'available'
    fourth = fourth.to_int()

    
    g.data firstname, [first]
    g.data secondname, [second]
    g.data thirdname, [third]
    g.data fourthname, [fourth]
    g.marker_count = 1
    g.minimum_value = 0
    g.theme = {
      :colors => %w(#D65433 #DAA520 #B7B43F #5F9EA0),
      :marker_color => 'grey',
      :background_colors => ['white', 'white', :top_bottom]

      }

    g.write('app/assets/images/test.png')

  else


  end

  end

  def pdf

      # Load the html to convert to PDF
    html = File.read("app/views/materials/index.html.erb")
    # Create a new kit and define page size to be US letter
    kit = PDFKit.new(html, :page_size => 'Letter')
    # Load our stylesheet into the kit to have colors & formatting
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/bootstrap.min.css"
    # Save the html to a PDF file
    kit.to_file("app/assets/materials")
    # Render the html


   send_file 'app/assets/materials.pdf', :type=>"application/pdf", :x_sendfile=>true



end

  # GET /materials/1s
  # GET /materials/1.json
  def show
    @nombre = 'Detalles del elemento'
    
  end

  # GET /materials/new
  def new
    @material = Material.new
    @nombre = 'Nuevo elemento'
  end

  # GET /materials/1/edit
  def edit
    @nombre = 'Editar elemento'
  end

  # POST /materials
  # POST /materials.json
  def create
    @nombre = 'Nuevo elemento'
    @material = Material.new(material_params)

    respond_to do |format|
      if @material.save
        format.html { redirect_to @material, notice: 'El inventario ha sido actualizado.' }
        format.json { render :show, status: :created, location: @material }
      else
        format.html { render :new }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    @nombre = 'Editar elemento'
    respond_to do |format|
      if @material.update(material_params)
        format.html { redirect_to @material, notice: 'El inventario ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @material }
      else
        format.html { render :edit }
        format.json { render json: @material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    @nombre = 'Eliminar elemento'
    @material.destroy
    respond_to do |format|
      format.html { redirect_to materials_url, notice: 'El elemento ha sido eliminado correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_material
      @material = Material.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def material_params
        params.require(:material).permit(:name, :available, :unit_id)

    end
end
