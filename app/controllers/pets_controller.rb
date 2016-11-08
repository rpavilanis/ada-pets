class PetsController < ApplicationController
  def index
    pets = Pet.all
    render :json => pets.as_json(), :status => :ok
    # render :json => pets.as_json(:except => [:created_at, :updated_at]), :status => :ok
  end

  def show
    pet = Pet.find_by(id: params[:id])

    if pet
      render :json => pet.as_json(), :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def search
    pets = Pet.where(name: params[:query].capitalize)
    unless pets.empty?
      render :json => pets.as_json(), :status => :ok
    else
      render :json => [], :status => :no_content
    end

  end

end
