class WallsController < ApplicationController

  def index
    @items = Item.all
    render
  end

end
