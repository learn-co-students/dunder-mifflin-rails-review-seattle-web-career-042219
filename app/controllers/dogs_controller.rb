class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.create(dog_params)
    redirect_to @dog
  end

  def edit
    @dog = Dog.find(params [:id])
  end

  def update
    @dog = Dog.find(params [:id])
    @dog.update(dog_params)
    redirect_to @dog
  end

  private

  def dogs_params
    params.require(:dogs).permit(:name, :breed, :age)
  end
end
