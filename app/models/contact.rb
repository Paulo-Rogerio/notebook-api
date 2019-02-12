class Contact < ApplicationRecord
    def autor
        "UI"
    end

    def as_json(otions={})
	    super(methods: :autor, root: true)
    end
end
