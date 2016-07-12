class MarcasController < ApplicationController
	def index
		@marca = Marca.all;
	end
	def show
		@marca = Marca.find(params[:id])
	end
	def new
	end
	def create
		@marca = Marca.new(marca_params)
		@marca.save
		redirect_to action: "index"
	end

	private
	  def marca_params
	    params.require(:marca).permit(:nombre, :text)
	  end
end

