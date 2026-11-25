class Api::EmployeesController < ApplicationController
 rescue_from ActiveRecord::RecordNotFound, with: :employee_not_found
  def index 
    employees = Employee.all
    render json: {data: employees},status: 200
  end
  def create
    employee = Employee.new(employee_params)
    if employee.save 
      render json: {data: employee}, status: 201
    else 
      render json: {errors:{message:employee.errors.to_hash}},status: 422
    end
  end

  def show
    id = params[:id]
    employees = Employee.find(id)
    render json: {data: employees},status: 200
  end

  def destroy
    id = params[:id]
    employee = Employee.find(id)
    if employee.destroy
      head 204
    end
  end

  def update 
    id = params[:id]
    employee = Employee.find(id)
    if employee.update(employee_params)
      render json: {data: employee},status: 200
    end
  end
  private 
  def employee_params
    params.permit(:department_id, :employee_code, :full_name, :phone, :hire_date, :status)
  end
  def employee_not_found
    render json: {
      errors: {message: ["Employee not found."]},status: 404
    }
  end
end
