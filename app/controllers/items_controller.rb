class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]

  # GET /items
  def index
    @items = []
    aitems = Item.all
    aitems.each do |item|
      location = ItemLocation.where(item_id: item.id)
      locations = []
      location.each do |loc|
        locations.push({
                         name: Location.find_by(id: loc.location_id).name,
                         quantity: loc.quantity
                       })
      end
      @items.push({
                    id: item.id,
                    name: item.name,
                    description: item.description,
                    price: item.price,
                    loc_name: locations
                  })
    end
    @items
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
    @item = Item.new(
      name: item_params[:name],
      description: item_params[:description],
      price: item_params[:price]
    )

    respond_to do |format|
      if @item.save
        item_location = ItemLocation.new(item_id: @item.id, location_id: item_params[:location_id],
                                         quantity: item_params[:quantity])
        if item_location.save
          format.html { redirect_to item_url(@item), notice: 'Item was successfully created.' }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  def update
    respond_to do |format|
      if @item.update(
        name: item_params[:name],
        description: item_params[:description],
        price: item_params[:price],
        location_id: item_params[:location_id],
        quantity: item_params[:quantity]
      )
        format.html { redirect_to item_url(@item), notice: 'Item was successfully created.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
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
