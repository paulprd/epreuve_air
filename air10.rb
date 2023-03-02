# Afficher le contenu

# Fonctions utilisées
def read_file(file_name)
	file = File.open(file_name)
	content = file.read
	file.close
	return content
end

# Partie 1 : Gestion d'erreurs
if ARGV.length != 1
	puts "error: wrong number of arguments"
	exit
end

if !File.exists?(ARGV[0])
	puts "error: file doesn't exist"
	exit
end

# Partie 2 : Parsing
file_name = ARGV[0]

# Partie 3 : Résolution
content = read_file(file_name)

# Partie 4 : Affichage
puts content