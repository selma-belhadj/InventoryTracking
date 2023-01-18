class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items
  def index
    @items = Item.includes(:locations, :item_locations).map do |item|
      {
        id: item.id,
        name: item.name,
        description: item.description,
        price: item.price,
        loc_name: item.locations.map do |location|
          { name: location.name, quantity: item.item_locations.find_by(location_id: location.id).quantity }
        end
      }
    end
  end
  
  # GET /items/1
  def show; end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
  end

  # POST /items
  def create
    @item = Item.new(item_params.except(:location_id, :quantity))
  
    if @item.save
      @item.item_locations.create(location_id: item_params[:location_id], quantity: item_params[:quantity])
      redirect_to item_url(@item), notice: 'Item was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      redirect_to item_url(@item), notice: 'Item was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  

  # DELETE /items/1
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    item = Item.find(params[:id])
    location = ItemLocation.where(item_id: item.id)
    locations = []
    location.each do |loc|
      locations.push({
                       name: Location.find_by(id: loc.location_id).name,
                       quantity: loc.quantity
                     })
    end
    @item = {
      id: item.id,
      name: item.name,
      description: item.description,
      price: item.price,
      loc_name: locations
    }
    @item
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :description, :price, :location_id, :quantity)
  end
end
