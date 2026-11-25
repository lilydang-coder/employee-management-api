class Api::DepartmentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :department_not_found
  def create
    department = Department.new(department_params)
    if department.save
      render json: department, status: 201
    else 
      render json: {errors: department.errors.to_hash}, status: 422
    end
  end

  def index 
    keyword = params[:name].to_s.strip
    departments = Department.all

    if keyword.present?
      pattern = "%#{Department.sanitize_sql_like(keyword)}%"
      departments = Department.where("name LIKE ?",pattern)
    end
    render json: {data:departments,pages: 1}, status: 200
  end

  def update
    id = params[:id]
    department = Department.find(id)
    if department.update(department_params)
      render json: department, status: 200
    else 
      render json: {errors: department.errors.to_hash}, status: 422
    end
  end

  def destroy
    id = params[:id]
    department = Department.find(id)
    if department.destroy 
      head 204 
    else 
      render json: {errors: department.errors.to_hash}, status: 409
    end
  #rescue ActiveRecord::InvalidForeignKey #Lỗi phát sinh từ ràng buộc khóa ngoại trong MySQL
 #     render json: {message: ["This department is still referenced by other records"]}, status: 409
  end

  def show 
    id = params[:id]
    department = Department.find(id)
    render json: department, status: 200
  end

  private 
  def department_params
    params.permit(:name, :status, :description)
  end
  def department_not_found
    render json: {
      errors: {message: ["Department not found."]},status: 404
    }
  end
end
