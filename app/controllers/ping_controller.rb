class PingController < ApplicationController
    before_action :log_ping, only: :create 

  def show
    name = params[:name]
    #name = request.query_parameters["name"]

    if name.blank?
      render json: {message: "Hello"}, status: :ok
    else 
       render json: {message: "Hello #{name}"}, status: :ok
    end
  end

  def path_param
    id = params[:id]
    render json: {message: "ID: #{id}"}, status: :ok
  end

  def create
      puts "2. Chạy create"
      # name = params[:name]
      # render json: {name: name}, status: :ok
      allowed_params = params.permit(:name) #test strong parameter
      render json: allowed_params.to_h, status: :ok
  end

  def update 
    render json: { id: params[:id], name: params[:name] }, status: :ok
  end

  private

  def log_ping
    puts "1. Chạy log_ping"
  end

  def destroy 
    head :no_content
  end
end
