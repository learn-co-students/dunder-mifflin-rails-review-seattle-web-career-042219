class EmployeesController < ApplicationController

  before_action :set_employee, only: [:edit, :show, :update]

  def index
    @employees = Employee.all
  end

  def new
    if flash[:employee_attributes]
      @employee = Employee.new(flash[:employee_attributes])
    else
      @employee = Employee.new
    end
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.valid?
      @employee.save

      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      flash[:employee_attributes] = @employee.attributes
      render :new
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      render :edit
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
