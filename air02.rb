# Concat

# Fonctions utilisées
def array_to_str(to_concat, separator)
	result = to_concat.join(separator)
	return result
end

# Partie 1 : Gestion d'erreurs
if ARGV.length < 3
	puts "error: not enough arguments"
	exit
end

# Partie 2 : Parsing
separator = ARGV.last
to_concat = ARGV
to_concat.pop

# Partie 3 : Résolution
result = array_to_str(to_concat, separator)

# Partie 4 : Affichage
puts result