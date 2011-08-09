class OwnershipsController < ApplicationController
  def new
    @ownership = Ownership.new
    # @contact = Contact.new
  end

  def show
  end

  def index
  end

  def create
    @contact = Contact.new(params[:contact])
    logger.debug @contact.phone
    logger.debug params[:override]
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
