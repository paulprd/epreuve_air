# Sur chacun d’entre eux

# Fonctions utilisées
def is_number(str)
	return true if Float(str) rescue false
end

def are_numbers(array)
	return array.all? { |element| is_number(element) }
end

def array_print(array)
	for element in array
		print "#{element} "
	end
	puts
end

def array_operation(array, operation)
	result = []
	op = operation.to_i

	for element in array
		result.push(element.to_i + op)
	end

	return result
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 2
	puts "error: not enough arguments"
	exit
end

if !are_numbers(ARGV)
	puts "error: bad arguments"
	exit
end

# Partie 2 : Parsing
operation = ARGV.last
elements = ARGV
elements.pop

# Partie 3 : Résolution
result = array_operation(elements, operation)

# Partie 4 : Affichage
array_print(result)