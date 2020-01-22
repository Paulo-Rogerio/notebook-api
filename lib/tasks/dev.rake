namespace :dev do
  desc "Configurar ambiente de desenvolvimento"
  task setup: :environment do

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

  end
end
