class LayersController < ApplicationController
  layout "dashboard"
  
  respond_to :html, :json

  def index
    @layers = Layer.all
  end

  def new
    @layer = Layer.new
  end

  def create
    @layer = Layer.new(layer_params)
    respond_with(@layer) do |format|
      if @layer.save
        format.html { redirect_to @layer, :notice => 'Layer was successfully created.' }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def edit
   @layer =  Layer.find(params[:id])
  end

  def update
    @layer = Layer.find(params[:id])

    respond_with(@layer) do |format|
      if @layer.update_attributes(layer_params)
        format.html { redirect_to @layer, :notice => 'Layer was successfully updated.' }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def show
    @layer = Layer.find(params[:id])

    respond_with(@layer)
  end

  def destroy
    @layer = Layer.find(params[:id])
    @layer.destroy
    flash[:notice] = 'Layer was successfully deleted.'

    respond_with(@layer)
  end

  private

  def layer_params
    params.require(:layer).permit(:name, :description)
  end
end
