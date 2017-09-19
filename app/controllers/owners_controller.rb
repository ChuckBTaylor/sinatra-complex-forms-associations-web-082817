class OwnersController < ApplicationController
  set :views, "app/views/owners"

  get '/owners' do
    @owners = Owner.all
    erb :index
  end

  get '/owners/new' do
    @pets = Pet.all
    erb :new
  end

  post '/owners' do
    @owner = Owner.create(params[:owner])
    unless params[:pet][:name].empty?
      @owner.pets << Pet.create(name: params[:pet][:name])
    end
    @owner.save
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id/edit' do
    @owner = Owner.find(params[:id])
    erb :edit
  end

  patch '/owners/:id' do
    @owner = Owner.find(params[:id])
    # binding.pry
    @owner.update(params[:owner])
    unless params[:pet][:name].empty?
      @owner.pets << Pet.create(name: params[:pet][:name])
    end
    redirect to "owners/#{@owner.id}"
  end

  get '/owners/:id' do
    @owner = Owner.find(params[:id])
    erb :show
  end



end
