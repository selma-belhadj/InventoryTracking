class ItemLocationsController < ApplicationController
  before_action :set_item_location, only: %i[show edit update destroy]

  def index
    @item_locations = ItemLocation.joins(:item, :location)
  end

  def new
    @item_location = ItemLocation.new
  end

  def show; end

  def edit; end

  def create
    @item_location = ItemLocation.find_or_create_by(location: item_locations_params[:location],
                                                    item: item_locations_params[:item])
    if @item_location.persisted?
      @item_location.update(item_locations_params)
    else
      @item_location.assign_attributes(item_locations_params)
    end

    respond_to do |format|
      if !@item_location.persisted? && @item_location.save
        format.html { redirect_to item_location_url(@item_location), notice: 'Item Location was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item_location.update(item_locations_params)
        format.html { redirect_to item_location_url(@item_location), notice: 'Item Location was successfully updated.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  def destroy
    @item_location.destroy

    respond_to do |format|
      format.html { redirect_to item_locations_path, notice: 'Item Location was successfully destroyed.' }
    end
  end

  private

  def set_item_location
    @item_location = ItemLocation.find(params[:id])
  end

  def item_locations_params
    params.require(:item_location).permit(:item_id, :location_id, :quantity)
  end
end
