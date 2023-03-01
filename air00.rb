# Par ordre ascii

# Fonctions utilisées
def array_print(array)
	for element in array
		puts "#{element}"
	end
end

def is_in(char, str)
	needle = char.split('')[0]
	haystack = str.split('')

	for c in haystack
		if c == needle
			return true
		end
	end
	return false
end

def str_to_array(str_to_cut, separators)
	array = []
	str = str_to_cut.split('')

	i = 0
	while i < str.length
		sub_array = []
		while i < str.length && !is_in(str[i], separators)
			sub_array.push(str[i])
			i += 1
		end

		if !sub_array.empty?
			array.push(sub_array.join(''))
		end
		i += 1
	end
	return array
end




# Partie 1 : Gestion d'erreurs
if ARGV.length != 1
	puts "error: wrong number of arguments"
	exit
end

# Partie 2 : Parsing
str_to_cut = ARGV[0]
separators = "\s\t\n"

# Partie 3 : Résolution
result = str_to_array(str_to_cut, separators)

# Partie 4 : Affichage
array_print(result)