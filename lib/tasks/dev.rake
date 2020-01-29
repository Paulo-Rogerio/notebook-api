namespace :dev do
  desc "Configurar ambiente de desenvolvimento"
  task setup: :environment do

    # Executa no terminal os comandos que estao dentro do %x
    puts "Zerando o Banco..."
    %x(rails db:drop db:create db:migrate)
    puts "Sucesso"

    #===== Criando Tipos (Aula 16) ======# 
    puts "Cadastrando kinds..."
    kinds = %w(Amigo Comercial Conhecido)
    kinds.each do |kind| 
      Kind.create!(
        description: kind
      )
    end
    puts "Sucesso!"

    #===== Criando Usuários (Aula 10) =====# 
    puts "Cadastrando os contatos..."
    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.between(35.years.ago, 18.years.ago),
        kind: Kind.all.sample
      )
    end
    puts "Sucesso!"

    #===== Criando Telefones (Aula 21) =====# 
    puts "Cadastrando os telefones..."
    Contact.all.each do |contact| 
      5.times do |i|
        phone = Phone.create!(number: Faker::PhoneNumber.cell_phone)
        contact.phones << phone
        contact.save!
      end
    end
    puts "Sucesso!"

    #===== Criando Telefones (Aula 24) =====# 
    puts "Cadastrando os enderecos..."
    Contact.all.each do |contact|
      Address.create!(street: Faker::Address.street_address,
                      city: Faker::Address.city,
                      contact: contact)
    end
    puts "Sucesso!"    

  end
end
