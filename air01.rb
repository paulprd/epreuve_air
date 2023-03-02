# Split en fonction

# Fonctions utilisées
def array_print(array)
	for element in array
		puts "#{element}"
	end
end

def str_to_array(str_to_cut, separator)
	array = []
	str = str_to_cut.split('')
	sep = separator.split('')

	i = 0
	while i < str.length
		sub_array = []

		is_sep = false
		while i < str.length && !is_sep
			is_sep = true
			j = 0
			while i+j < str.length && j < sep.length
				if str[i+j] != sep[j]
					is_sep = false
					break
				end
				j += 1
			end

			if !is_sep
				sub_array.push(str[i])
				i += 1
			else
				i += sep.length-1
			end
		end

		if !sub_array.empty?
			array.push(sub_array.join(''))
		end

		i += 1
	end
	return array
end

# Partie 1 : Gestion d'erreurs
if ARGV.length != 2
	puts "error: wrong number of arguments"
	exit
end

# Partie 2 : Parsing
str_to_cut = ARGV[0]
separator = ARGV[1]

# Partie 3 : Résolution
result = str_to_array(str_to_cut, separator)

# Partie 4 : Affichage
array_print(result)