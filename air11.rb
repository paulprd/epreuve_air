# Afficher une pyramide

# Fonctions utilisées
def is_number(str)
	return true if Float(str) rescue false
end

def print_pyramid(char, height)
	for i in 1..height
		for j in 0..height-i-1
			print ' '
		end
		for j in 0..(i-1)*2
			print char
		end
		puts
	end
end

# Partie 1 : Gestion d'erreurs
if ARGV.length != 2
	puts "error: wrong number of arguments"
	exit
end

if !is_number(ARGV[1])
	puts "error: bad arguments"
	exit
end

# Partie 2 : Parsing
char = ARGV[0].split('')[0]
height = ARGV[1].to_i

# Partie 3 : Résolution

# Partie 4 : Affichage
print_pyramid(char, height)