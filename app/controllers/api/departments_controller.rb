class Api::DepartmentsController < ApplicationController
  
  def create
    department = Department.new(department_params)
    if department.save
      render json: department, status: 201
    else 
      render json: {errors: department.errors.to_hash}, status: 422
    end
  end

  def index 
    departments = Department.all
    render json: {message: departments}, status: 201
  end

  def update
    id = params[:id]
    department = Department.find(id)
    if department.update(department_params)
      render json: department, status: 201
    else 
      render json: {errors: department.errors.to_hash}, status: 422
    end
  end

  def destroy
    id = params[:id]
    department = Department.find(id)
    if department.destroy 
      head :no_content
    else 
      render json: {errors: department.errors.to_hash}, status: 409
    end
  rescue ActiveRecord::InvalidForeignKey
      render json: {errors: {base: ["This department is still referenced by other records"]}}, status: 409
  end

  def show 
    id = params[:id]
    department = Department.find(id)
    render json: department, status: 201
  end
  private 
  def department_params
    params.require(:department).permit(:name, :status, :description)
  end

end
