class DogsController < ApplicationController

    before_action :set_dog, only: [:show, :edit, :update]

    def index
        @dogs = Dog.all 
    end



    private

    def dogs_params
        params.require(:dog).permit(:name, :breed, :age)
    end

    def set_dog
        @dog = Dog.find(params[:id])
    end
end
