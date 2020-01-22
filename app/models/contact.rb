class Contact < ApplicationRecord
    belongs_to :kind
    has_many :phones
    accepts_nested_attributes_for :phones

    # Relacionamentos ( Contatos pertence a um tipo)
    # Faz com que a obrigatoriedade de se cadastrar um tipo 
    # nao ocorra.
    # belongs_to :kind, optional: true

    # Desta maneira não preciso personalizar para cada method, 
    # pois será reescrito o method original "as_json"
    # Assim ele se aplicará em todos os methods da controller. 
    # O super invoca o as_json original. ( Aula 15 )

    # def autor
    #     "UI"
    # end

    # def kind_description
    #    self.kind.description
    # end

    # def as_json(otions={})
    #     super(
    #         root: true,
    #         # methods: :autor,
    #         # include: :kind 
    #         # include: { kind: { only: :description }}
    #         methods: [:autor, :kind_description]
    #     )
    # end
end
