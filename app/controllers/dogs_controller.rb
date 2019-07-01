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
    Dog.create(dog_params)
    flash[:success] = 'your dog was created'
    redirect_to '/dogs/new'
  end

  def update
    id = params[:id]
    @dog = Dog.find(id)
    @dog.update(dog_params)
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

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)
  end
end
