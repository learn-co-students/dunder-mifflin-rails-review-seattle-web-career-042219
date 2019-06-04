class EmployeesController < ApplicationController

    def index
        @employees = Employee.all
    end

    def show
        employee_finder
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee=Employee.new(employee_params)
        if @employee.save
            flash[:success] = 'Employee created'
            redirect_to employee_path(@employee)
        else
            flash[:error] = 'Employee not created'
            puts @employee.errors.full_messages
            render :new
        end
    end

    def edit
        employee_finder
    end

    def update
        employee_finder
        if @employee.update(employee_params)
            flash[:success] = 'Employee updated'
            redirect_to employee_path(@employee)
        else
            flash[:error] = 'Employee not updated'
            puts @employee.errors.full_messages
            render :edit
        end
    end

    def destroy
        employee_finder
        if @employee.destroy
            flash[:success] = 'Employee deleted'
        else
            flash[:error] = 'Employee did not delete'
            puts @employee.errors.full_messages
            redirect_to employee_path(@employee)
        end
    end

    private
        def employee_finder
            @employee = Employee.find(params[:id])
        end

        def employee_params
            params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        end
end
