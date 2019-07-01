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
    dog = params[:dog]
    Dog.create(name: dog[:name], age: dog[:age], breed:dog[:breed])
    flash[:success] = 'your dog was created'
    redirect_to '/dogs/new'
  end

  def update
    id = params[:id]
    @dog = Dog.find(id)
    dog_data = params[:dog]
    @dog.update(name: dog_data[:name], age: dog_data[:age], breed:dog_data[:breed])
    flash[:success] = 'your dog was updated'
    redirect_to dog_edit_path(@dog)
  end

  def delete
    id = params[:id]
    @dog = Dog.find(id)
    @dog.destroy
    flash[:success] = 'your dog was deleted'
    redirect_to '/dogs/index'
  end

  def edit
    id = params[:id]
    @dog = Dog.find(id)
  end
end
