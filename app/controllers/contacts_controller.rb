class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all
      render json: @contacts, status: :ok
    # render json: @contacts, status: :ok, only: [:name, :email]
    # render json: @contacts.map { |i| i.attributes.merge({ novo_atributo: "UI"}) }
    # render json: @contacts, status: :ok , methods: :autor
  end

  # GET /contacts/1
  def show
    render json: @contact
    # render json: @contact.attributes.merge({ novo_atributo: "UI"})
    # render json: @contact, methods: :autor
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate)
    end
end
