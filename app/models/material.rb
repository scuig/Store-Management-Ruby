class Material < ActiveRecord::Base
	has_many :products_materials
	has_many :products, through: :products_materials

	has_many :materials_purchases
	has_many :purchases, through: :materials_purchases

	has_one :unit, :class_name => Unit, :foreign_key => "id", :primary_key => "unit_id"

	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
	      all.each do |material|
	        csv << material.attributes.values_at(*column_names)
	      end
		end
	end

	def self.to_pdf
		  # Load the html to convert to PDF
    html = File.read("app/views/materials/index.html.erb")
    # Create a new kit and define page size to be US letter
    kit = PDFKit.new(html, :page_size => 'Letter')
    # Load our stylesheet into the kit to have colors & formatting
    kit.stylesheets << "#{Rails.root}/app/assets/stylesheets/bootstrap.min.css"
    # Save the html to a PDF file
    kit.to_file("app/assets/materials.pdf")
    # Render the html
    render :text => html
end
end
