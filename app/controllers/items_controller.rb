require 'mercado_libre'
class ItemsController < ApplicationController

  # GET /items/1
  def show
    detail = get_item()
    if detail == nil
      return render json: {
        error: 'not found' 
      }
    end

    item = Item.new()
    item.ml_id = detail["id"]
    item.detail = {
      title: detail["title"]
    }
    item.save

    render :json => {
      id: item.ml_id
    }
  end

  def all
    all_items = Item.all()
    render json: all_items 
  end

  private
    def get_item
      id = params[:id]
      raw_item = MercadoLibre.new().item(id)
      
      return raw_item
    end

end
