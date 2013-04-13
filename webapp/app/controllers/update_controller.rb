class UpdateController < ApplicationController
  def show
    id = params[:id]
    @request = Request.find(id)
  end
    
  def update 
    
  end
end
