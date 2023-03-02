# Chercher l’intrus

# Fonctions utilisées
def is_same(str1, str2)
	s1 = str1.split('')
	s2 = str2.split('')

	if s1.length != s2.length
		return false
	end
	for i in 0..s1.length-1
		if s1[i] != s2[i]
			return false
		end
	end
	return true
end

def is_in(str, array)
	for element in array
		if is_same(str, element)
			return true
		end
	end
	return false
end

def find_alone(array)
	even = []
	len = array.length
	for i in 0..len-1
		if !is_in(array[i], even)
			alone = true
			for j in i+1..len-1
				if is_same(array[i], array[j])
					even.push(array[i])
					alone = false
				end
			end
			if alone
				return array[i]
			end
		end
	end
	return -1
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 1
	puts "error: not enough arguments"
	exit
end

# Partie 2 : Parsing
elements = ARGV

# Partie 3 : Résolution
result = find_alone(elements)

# Partie 4 : Affichage
puts result