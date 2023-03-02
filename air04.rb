# Un seul à la fois

# Fonctions utilisées
def str_uniq(str)
	s = str.split('')
	i = 0
	while i+1 < s.length
		if s[i] == s[i+1]
			s.delete_at(i)
		else
			i += 1
		end
	end
	return s.join('')
end

# Partie 1 : Gestion d'erreurs
if ARGV.length != 1
	puts "error: wrong number of arguments"
	exit
end

# Partie 2 : Parsing
str = ARGV[0]

# Partie 3 : Résolution
result = str_uniq(str)

# Partie 4 : Affichage
puts result