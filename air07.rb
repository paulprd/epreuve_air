# Insertion dans un tableau trié

# Fonctions utilisées
def array_print(array)
	for element in array
		print "#{element} "
	end
	puts
end

def is_number(str)
	return true if Float(str) rescue false
end

def are_numbers(array)
	return array.all? { |element| is_number(element) }
end

def array_str_to_int(array)
	result = []
	for element in array
		result.push(element.to_i)
	end
	return result
end

def sorted_insert(array, new_element)
	result = []
	i = 0
	while i < array.length && new_element > array[i]
		result.push(array[i])
		i += 1
	end
	result.push(new_element)
	while i < array.length
		result.push(array[i])
		i += 1
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
new_element = ARGV.last.to_i
sorted_array = ARGV
sorted_array.pop
sorted_array = array_str_to_int(sorted_array)

# Partie 3 : Résolution
result = sorted_insert(sorted_array, new_element)

# Partie 4 : Affichage
array_print(result)