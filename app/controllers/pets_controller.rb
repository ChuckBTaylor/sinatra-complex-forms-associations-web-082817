class PetsController < ApplicationController
  set :views, "app/views/pets"

  get '/pets' do
    @pets = Pet.all
    erb :index
  end

  get '/pets/new' do
    erb :new
  end

  post '/pets' do
    @pet = Pet.create(params[:pet])
    unless params[:owner_name].empty?
      @owner = Owner.create(name: params[:owner_name])
      @owner.pets << @pet
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :show
  end

  patch '/pets/:id' do
    @pet = Pet.create(params[:pet])
    unless params[:owner][:name].empty?
      @owner = Owner.create(name: params[:owner][:name])
      @owner.pets << @pet
    end
    # binding.pry
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :edit
  end

end
