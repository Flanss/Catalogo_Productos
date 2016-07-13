class MarcasController < ApplicationController
	def index
		@marca = Marca.all
	end
	def show
		@marca = Marca.find(params[:id])
	end
	def new
		@marca = Marca.new
	end
	def edit
	  @marca = Marca.find(params[:id])

	end
	def create
		@marca = Marca.new(marca_params)
		if @marca.save
		redirect_to action: "index"
		else render 'new'
		end
	end
	def update
	  @marca = Marca.find(params[:id])
	  @producto = Producto.where(marca: @marca.nombre)
	  if @marca.update(marca_params)
		  	@marca = Marca.find(params[:id])
		  	@producto.each do |produ|
		    @producto.update(marca: @marca.nombre )
	 		 end 
		redirect_to action: "index"
	   else render 'edit' 
		end
	end

	def destroy
		@marca = Marca.find(params[:id])
		@producto = Producto.where(marca: @marca.nombre)
	    @producto.each do |produ|
	    @producto.destroy(produ.id)
		end
		@marca.destroy
	    redirect_to action: "index"
 	 end


	private
	  def marca_params
	    params.require(:marca).permit(:nombre, :text)
	  end
	end
