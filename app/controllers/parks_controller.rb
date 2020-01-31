class ParksController < ApplicationController
  include Response

  def index
    if params[:national]
      @parks = Park.find_national
    elsif params[:random]
      @parks = Park.get_random
    elsif params[:state]
      state = params[:state]
      @parks = Park.find_state(state)
    else
      name = params[:name]
      @parks = Park.search(name)
    end
    json_response(@parks)
  end

  def show
    @park = Park.find(params[:id])
    json_response(@park)
  end

  def create
    @park = Park.create!(park_params)
    json_response(@park, :created)
  end

  def update
    @park = Park.find(params[:id])
    if @park.update!(park_params)
      render status: 200, json: {
        message: "This park has been updated successfully."
      }
    end
  end

  def destroy
    @park = Park.find(params[:id])
    if @park.destroy
      render status: 200, json: {
        message: "This park has been destroyed successfully."
      }
    end
  end

  def park_params
    params.permit(:state, :name, :national)
  end
end
