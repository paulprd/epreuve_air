# Rotation vers la gauche

# Fonctions utilisées
def array_print(array)
	for element in array
		print "#{element} "
	end
	puts
end

def left_rotation(array)
	tmp = array[0]
	for i in 0..array.length-2
		array[i] = array[i+1]
	end
	array[array.length-1] = tmp
	return array
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 2
	puts "error: wrong number of arguments"
	exit
end

# Partie 2 : Parsing
array = ARGV

# Partie 3 : Résolution
result = left_rotation(array)

# Partie 4 : Affichage
array_print(result)