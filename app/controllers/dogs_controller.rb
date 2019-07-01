class DogsController < ApplicationController
  def new
    @dog = Dog.new()
  end

  def index
    @dogs = Dog.all
  end

  def show
    id = params[:id]
    @dog = Dog.find(id)
  end

  def create
    # code to create a dog in the data base
    dog = params[:dog]
    Dog.create(name: dog[:name], age: dog[:age], breed:dog[:breed])
    flash[:success] = 'your dog was created'
    redirect_to '/dogs/new'
  end

  def delete
    id = params[:id]
    @dog = Dog.find(id)
    @dog.destroy
    flash[:success] = 'your dog was deleted'
    redirect_to '/dogs/index'
  end
end
