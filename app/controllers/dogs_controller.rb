class DogsController < ApplicationController

    def index
        @dogs = Dog.all
    end

    def show
        dog_finder
    end

    def new
        Dog.new
    end

    def create
        @dog=Dog.new(dog_params)
        if @dog.save
            flash[:success] = 'Dog created'
            redirect_to dog_path(@dog)
        else
            flash[:error] = 'Dog not created'
            puts @dog.errors.full_messages
            render :new
        end
    end

    def edit
        dog_finder
    end

    def update
        dog_finder
        if @dog.update(dog_params)
            flash[:success] = 'Dog updated'
            redirect_to dog_path(@dog)
        else
            flash[:error] = 'Dog not updated'
            puts @dog.errors.full_messages
            render :edit
        end
    end

    def destroy
        dog_finder
        if @dog.destroy
            flash[:success] = 'Dog deleted'
        else
            flash[:error] = 'Dog did not delete'
            puts @dog.errors.full_messages
            redirect_to dog_path(@dog)
        end
    end

    private
        def dog_finder
            @dog = Dog.find(params[:id])
        end

        def dog_params
            params.require(:dog).permit(:name, :breed, :age)
        end
end
