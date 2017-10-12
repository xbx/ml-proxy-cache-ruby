require 'mercado_libre'
require 'benchmark'

class ItemsController < ApplicationController

  # GET /items/1
  def get_item
    begin
      id = params[:id]
      cache_hit = true
      item = nil

      # Search for the saved item
      time = Benchmark.measure do
        item = find_item(id)
      end

      if item === nil
        cache_hit = false
      
        time = Benchmark.measure do
          # Retrieve the item from a new API request
          item = retrieve_item(id)
        end
      end

      item.hit_counter = (item.hit_counter || 0) + 1
      item.save
      render :json => {
        item: item,
        cache_hit: cache_hit,
        total_time: time.real
      }
    rescue MercadoLibre::MercadoLibreException => e
      render :json => {
        error: e.message
      }
    end
  end

  def all
    all_items = Item.all()
    render json: all_items 
  end

  private
    def find_item id
      Item.where(:ml_id => id).first()
    end

    def retrieve_item id
      raw_item = MercadoLibre::MercadoLibreAPI.new().item(id)
  
      item = Item.new()
      item.ml_id = raw_item["id"]
      item.title = raw_item["title"]
      item.thumbnail = raw_item["thumbnail"]
      item.save
      return item
    end

end
