class User < ActiveRecord::Base
    validates :name, presence: true
    validates :email, uniqueness: true
end

# Para crear un nuevo usuario:

user = User.new(name: "Juan Pérez", email: "juan.perez@example.com")
user.save

# Para recuperar un usuario:

user = User.find(1)
puts user.name  # Imprime "Juan Pérez"



