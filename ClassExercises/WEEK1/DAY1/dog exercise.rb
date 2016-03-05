class Dog
	def initialize (arg1, arg2)
		@name = arg1
		@breed = arg2
		@persons= [ ]
	end

	def bark (bark)
		puts "#{bark}"
		# puts bark
	end

	def smell(who)
	  @persons.push(who)			
	end

	def people_smelled
		puts @persons
	end


end



class PetDog < Dog
	def initialize (arg1, arg2, arg3)
		#Añado el método initialize de la clase padre y me permite añadirle mis variables
		#Así si el initialize cambia lo estás importando completo tambien
		super(arg1, arg2) 
		#Estos nombres pueden ser cualquiera
		#Con super los argumentos ag1 ag2 estámos ASIGNANDOSELOS, es como hacer Dog.new(name,breed)

		@owner = arg3
	end

	def fetch (toy)
		puts "Go! for #{toy}"
	end
end

 # dog1 = Dog.new("Puppy", 2)
 # dog1.bark("HOLA")


petdoggy = PetDog.new("Puppy","Lab","Juan")
petdoggy.fetch("pelota")

petdoggy.smell("Juan")
petdoggy.smell("Arturo")
petdoggy.smell("Pedro")

# petdoggy.people_smelled

puts petdoggy.people_smelled.inspect