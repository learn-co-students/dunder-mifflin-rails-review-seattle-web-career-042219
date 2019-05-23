class DogsController < ApplicationController

  before_action :set_dog, only: [:show, :edit, :update]

  def index
    @dogs = Dog.all.sort_by {|dog| dog.employees.length}.reverse
  end



  private

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end
end
