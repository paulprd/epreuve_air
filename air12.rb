# Le roi des tris

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

def partition(array, first, last)
	pivot = array[last]
	pIndex = first
	i = first
	while i < last
		if array[i].to_i <= pivot.to_i
			array[i], array[pIndex] = array[pIndex], array[i]
			pIndex += 1
		end
		i += 1
	end
	array[pIndex], array[last] = array[last], array[pIndex]
	return pIndex
end

def quick_sort(array, first, last)
	if first < last
		j = partition(array, first, last)
		quick_sort(array, first, j-1)
		quick_sort(array, j+1, last)
	end
	return array
end

def my_quick_sort(array)
	return quick_sort(array, 0, array.length-1)
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 2
	puts "error: wrong number of arguments"
	exit
end

if !are_numbers(ARGV)
	puts "error: bad arguments"
	exit
end

# Partie 2 : Parsing
array = array_str_to_int(ARGV)

# Partie 3 : Résolution
result = my_quick_sort(array)

# Partie 4 : Affichage
array_print(result)
