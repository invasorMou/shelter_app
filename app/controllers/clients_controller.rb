class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def index
    @clients = Client.all
  end

  def show
    load_client
  end

  def create
    client = Client.new(client_params)
    if client.save
      message =  {success: 'Your client was created'}
    else
      message =  {success: client.errors.full_messages.to_sentence}
    end
    redirect_to new_client_path, flash: message
  end

  def update
    load_client
    @client.update(client_params)
    redirect_to edit_client_path(@client), flash: {success: 'Your client was updated'}
  end

  def destroy
    load_client
    @client.destroy
    redirect_to clients_path, flash: {success: 'Your client was deleted'}
  end

  def edit
    load_client
  end

  private

  def client_params
    params.require(:client).permit(:name, :age, :email)
  end

  def load_client
    @client = Client.find(params[:id])
  end
end
