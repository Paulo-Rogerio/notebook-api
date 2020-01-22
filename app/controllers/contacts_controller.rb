class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all
    render json: @contacts

    # Aula 15
    # Ativar a raiz na response 
    # render json: @contacts, root: true
    # =======
    # Status Ok é implicito ja (https://httpstatuses.com/)
    # render json: @contacts, status: :ok 
    # render json: @contacts, status: :partial_content
    # ======= 
    # Filtrar os campos que eu quero que apareca
    # render json: @contacts, status: :ok, only: [:name, :email]
    # =======
    # Adicionar um novo campo que não esteja no meu Objeto contato
    # render json: @contacts.map { |i| i.attributes.merge({ novo_atributo: "UI"}) }

    # ======= ( Forma mais simples + usual )
    # Precisaria do metodo autor dentro do model contact
    # render json: @contacts, status: :ok , methods: :autor
  end

  # GET /contacts/1
  def show
    # render json: @contact

    # =======
    # Adicionar um novo campo que não esteja no meu Objeto contato    
    # render json: @contact.attributes.merge({ novo_atributo: "UI"})
    # ======= ( Forma mais simples + usual )
    # Precisaria do metodo autor dentro do model contact    
    # render json: @contact, methods: :autor

    # ====== Comentei todos os metodos do model ( Aula 18 )
    # Se não colocar o include , ele não trara os dados do kind
    # Mesmo se houver relacionamento entre os model.
    render json: @contact, include: [:kind, :phones]    

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
      params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
    end
end
