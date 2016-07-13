class ProductosController < ApplicationController
	def index
		@producto = Producto.all
		@total = Producto.sum("precio")
	end
	def show
		redirect_to action: "index"
	end
	def new
		@producto = Producto.new
		@marca = Marca.all
	end
	def edit
	  @producto = Producto.find(params[:id])
	  @marca = Marca.all
	end
	def create
		@producto = Producto.new(producto_params)
		@marca = Marca.all
		if @producto.save
		redirect_to action: "index"
		else render 'new'
		end
	end 
	def update
	  @producto = Producto.find(params[:id])
	 
	  if @producto.update(producto_params)
	    redirect_to action: "index"
	  else
	  	@marca = Marca.all
	    render 'edit'
	  end
	end

	def destroy
	    @producto = Producto.find(params[:id])
	    @producto.destroy
	    redirect_to action: "index"
 	 end


	private
	  def producto_params
	    params.require(:producto).permit(:nombre, :marca, :descripcion, :precio)
	  end
	end

