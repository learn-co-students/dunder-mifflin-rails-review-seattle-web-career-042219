class EmployeesController < ApplicationController
    before_action :set_employee, only:[:show, :edit, :update]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)

        if @employee.valid?
            @employee.save
            redirect_to @employee
        else
            render :new
        end
    end

    def update


        if @employee.valid?
            @employee.update!
            redirect_to @employee
        else
            render :new
        end
    end


    private

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :title, :alias, :office, :img_url, :dog_id)
    end

    def set_employee
        @employee = Employee.find(params[:id])
    end
end
