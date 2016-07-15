class MarcasController < ApplicationController
	def index
		@marca = Marca.all
	end
	def show
		redirect_to action: "index"
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
	
	  if @marca.update(marca_params)
		  	redirect_to action: "index"
	   else render 'edit' 
		end
	end

	def destroy
		@marca = Marca.find(params[:id])
		@marca.destroy
	    redirect_to action: "index"
 	 end


	private
	  def marca_params
	    params.require(:marca).permit(:nombre, :text)
	  end
	end
