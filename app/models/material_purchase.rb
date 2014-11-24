class MaterialPurchase < ActiveRecord::Base
	belongs_to :material
	belongs_to :purchase


after_validation :sumar_inv
before_destroy :restar_inv

	def sumar_inv

	@producto = Material.find(material)

	cantidadNueva = @producto.read_attribute('available') + units

	@producto.update_columns(available: cantidadNueva)


	end

	def restar_inv

	@producto = Material.find(material)

	cantidadNueva = @producto.read_attribute('available') - units

	@producto.update_columns(available: cantidadNueva)


	end

end
