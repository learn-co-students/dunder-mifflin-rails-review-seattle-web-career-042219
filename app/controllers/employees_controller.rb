class EmployeesController < ApplicationController

  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    #byebug

    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end

  end


  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :alias, :dog_id, :office, :img_url)
  end
end
