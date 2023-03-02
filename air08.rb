# Mélanger deux tableaux triés

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

def are_well_formated(array)
	for element in array
		if !is_number(element) && !element.match(/fusion/)
			return false
		end
	end
end

def array_str_to_int(array)
	result = []
	for element in array
		result.push(element.to_i)
	end
	return result
end

def parsing_fusion(array)
	array1 = []
	array2 = []

	passed = false
	for element in array
		if element.match(/fusion/)
			passed = true
		else
			if !passed
				array1.push(element)
			else
				array2.push(element)
			end
		end
	end

	return array_str_to_int(array1), array_str_to_int(array2)
end

def sorted_fusion(array1, array2)
	result = []
	i = 0
	j = 0
	while i < array1.length && j < array2.length
		if array1[i] < array2[j]
			result.push(array1[i])
			i += 1
		else
			result.push(array2[j])
			j += 1
		end
	end

	if i == array1.length
		for k in j..array2.length-1
			result.push(array2[k])
		end
	else
		for k in i..array1.length-1
			result.push(array1[k])
		end
	end

	return result
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 3
	puts "error: not enough arguments"
	exit
end

if !are_well_formated(ARGV)
	puts "error: bad arguments"
	exit
end

# Partie 2 : Parsing
result = parsing_fusion(ARGV)
array1 = result[0]
array2 = result[1]

# Partie 3 : Résolution
result = sorted_fusion(array1, array2)

# Partie 4 : Affichage
array_print(result)