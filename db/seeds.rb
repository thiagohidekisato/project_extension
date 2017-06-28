Professor.create!(name:  "Example User",
             	email: "example@example.com",
             	phone: "(11) 1234-5678",
             	ramal: "123",
             	phone_cel: "(11) 98765-4321",
             	specialization: "Example",
             	room: "123",
             	lattes: "Example",
             	password:              "example",
             	password_confirmation: "example",
             	admin: true)

=begin
99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = "password"
  Professor.create!(name: name,
               email: email,
               phone: "(11) 1234-5678",
               ramal: "123",
               phone_cel: "(11) 98765-4321",
               specialization: "Example",
               room: "123",
               lattes: "Example",
               password:              password,
               password_confirmation: password)
end


professors = Professor.order(:created_at).take(6)
50.times do |n|
  name = "Project #{n+1}"
  content = Faker::Lorem.sentence(5)
  professors.each {
    |professor| professor.projects.create!(name: name,
                                           date_start: "21/05/2017",
                                           date_finish: "01/01/2018",
                                           fomento: true,
                                           local: "Unifesp",
                                           images: "No images",
                                           description: "Projeto em teste",
                                           n_participants: 4,
                                           v_volunteers: 10,
                                           v_bolsistas: 1,
                                           perfil_volunteers: "Em teste")
  }
end
=end
