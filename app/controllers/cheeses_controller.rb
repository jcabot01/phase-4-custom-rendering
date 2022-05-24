class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    # render json: cheeses, only: [:id, :name]
    # render json: cheeses, except: [:created_at, :updated_at]
    render json: cheeses, except: [:created_at, :updated_at], methods: [:summary]  #able to call methods from our Models
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    if cheese
      render json: cheese
    else
      render json: { error: "Cheese not found" }, status: :not_found  #use not_found or numeric status code like 404
    end
  end

end
