class Api::ClientsController < ApplicationController

  def index
    clients = Client.all

    render json: clients
  end

  def create
    client = Client.new
    client.assign_attributes(client_params)
    if client.save
      respond_to do |format|
        format.html
        format.json { render json: client }
      end
    else
      respond_to do |format|
        format.html
        format.json { render json: client.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    begin
      client = Client.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: client }
      end

    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end

  def update
    begin
      client = Client.find(params[:id])
      client.assign_attributes(client_params)
      if client.save
        respond_to do |format|
          format.html
          format.json { render json: client }
        end
      else
        respond_to do |format|
          format.html
          format.json { render json: client.errors, status: :unprocessable_entity }
        end
      end
    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: exception}, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      client = Client.find(params[:id])
      client.destroy
      respond_to do |format|
        format.html
        format.json { render json: client }
      end
    rescue => exception
      respond_to do |format|
        format.html
        format.json { render json: {message: "Client doesn't exist"}, status: :unprocessable_entity }
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name)
  end
end

