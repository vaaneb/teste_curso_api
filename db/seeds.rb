Personagem.delete_all 

5.times do 
    Personagem.create name: Faker::Name.name   
end
