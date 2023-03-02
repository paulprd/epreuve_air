# Contrôle de pass sanitaire

# Fonctions utilisées
def array_print(array)
	for element in array
		print "#{element} "
	end
	puts
end

def contain(str, char)
	c = char.split('')[0]
	strbis = str.split('')
	for i in strbis
		if i == c
			return true
		end
	end
	return false
end

def remove(array, char)
	if char >= 'a' && char <= 'z'
		low = char
		upp = (char.ord-32).chr
	elsif char >= 'A' && char <= 'Z'
		low = (char.ord+32).chr
		upp = char
	else
		return []
	end

	result = []
	for element in array
		if !contain(element, low) && !contain(element, upp)
			result.push(element)
		end
	end
	return result
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 2
	puts "error: wrong number of arguments"
	exit
end

# Partie 2 : Parsing
char = ARGV.last
elements = ARGV
elements.pop

# Partie 3 : Résolution
result = remove(elements, char)

# Partie 4 : Affichage
array_print(result)