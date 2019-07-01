class DogsController < ApplicationController
  def new
    @dog = Dog.new
  end

  def index
    @dogs = Dog.all
  end

  def show
    load_dog
  end

  def create
    Dog.create(dog_params)
    redirect_to new_dog_path, flash: {success: 'Your dog was created'}
  end

  def update
    load_dog
    @dog.update(dog_params)
    redirect_to edit_dog_path(@dog), flash: {success: 'Your dog was updated'}
  end

  def destroy
    load_dog
    @dog.destroy
    redirect_to dogs_path, flash: {success: 'Your dog was deleted'}
  end

  def edit
    load_dog
  end

  private

  def dog_params
    params.require(:dog).permit(:name, :age, :breed)
  end

  def load_dog
    @dog = Dog.find(params[:id])
  end
end
