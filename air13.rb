# Meta exercice

# Fonctions utilisées
require 'open3'

def output_script(command)
	stdin, stdout, stderr = Open3.popen3(command)
	return stdout.read
end

def full_test(test_name, command, expected, nb1, nb2)
	$global_nb += 1
	output = output_script(command)
	result = "#{test_name} (#{nb1}/#{nb2}) : "

	if output.match(/#{expected}/)
		puts "\e[32m#{result + "success"}\e[0m"
		$global_ok += 1
	else
		puts "\e[31m#{result + "failure"}\e[0m"
	end
end

# Partie 1 : Gestion d'erreurs
if ARGV.length != 0
	puts "error: no argument needed"
	exit
end

# Partie 2 : Tests
$global_nb = 0
$global_ok = 0

script = "air00"
nb = 2
full_test(script, 'ruby air00.rb "Bonjour les gars"', "Bonjour\nles\ngars", 1, nb)
full_test(script, 'ruby air00.rb "Hello world"', "Hello\nworld", 2, nb)

script = "air01"
nb = 2
full_test(script, 'ruby air01.rb "Crevette magique dans la mer des étoiles" "la"', "Crevette magique dans \n mer des étoiles", 1, nb)
full_test(script, 'ruby air01.rb "Hello world!" "world"', "Hello \n!", 2, nb)

script = "air02"
nb = 2
full_test(script, 'ruby air02.rb "Je" "teste" "des" "trucs" " "', "Je teste des trucs", 1, nb)
full_test(script, 'ruby air02.rb "Jolie" "crevette" " petite "', "Jolie petite crevette", 2, nb)

script = "air03"
nb = 2
full_test(script, 'ruby air03.rb 1 2 3 4 5 4 3 2 1', "5", 1, nb)
full_test(script, 'ruby air03.rb bonjour monsieur bonjour', "monsieur", 2, nb)

script = "air04"
nb = 2
full_test(script, 'ruby air04.rb "Hello milady,   bien ou quoi ??"', "Helo milady, bien ou quoi ?", 1, nb)
full_test(script, 'ruby air04.rb "112334556677777789"', "123456789", 2, nb)

script = "air05"
nb = 2
full_test(script, 'ruby air05.rb 1 2 3 4 5 "+2"', "3 4 5 6 7", 1, nb)
full_test(script, 'ruby air05.rb 10 11 12 20 "-5"', "5 6 7 15", 2, nb)

script = "air06"
nb = 2
full_test(script, 'ruby air06.rb "Michel" "Albert" "Thérèse" "Benoit" "t"', "Michel", 1, nb)
full_test(script, 'ruby air06.rb "Michel" "Albert" "Thérèse" "Benoit" "a"', "Michel Thérèse Benoit", 2, nb)

script = "air07"
nb = 2
full_test(script, 'ruby air07.rb 1 3 4 2', "1 2 3 4", 1, nb)
full_test(script, 'ruby air07.rb 10 20 30 40 50 60 70 90 33', "10 20 30 33 40 50 60 70 90", 2, nb)

script = "air08"
nb = 2
full_test(script, 'ruby air08.rb 10 20 30 fusion 15 25 35', "10 15 20 25 30 35", 1, nb)
full_test(script, 'ruby air08.rb 1 3 5 6 8 9 fusion 0 2 2 4 5 7', "0 1 2 2 3 4 5 5 6 7 8 9", 2, nb)

script = "air09"
nb = 2
full_test(script, 'ruby air09.rb "Michel" "Albert" "Thérèse" "Benoit"', "Albert Thérèse Benoit Michel", 1, nb)
full_test(script, 'ruby air09.rb 1 2 3 4 5', "2 3 4 5 1", 2, nb)

script = "air10"
nb = 1
full_test(script, 'ruby air10.rb "a.txt"', "Hello world", 1, nb)

script = "air11"
nb = 2
full_test(script, 'ruby air11.rb o 5', "    o\n   ooo\n  ooooo\n ooooooo\nooooooooo", 1, nb)
full_test(script, 'ruby air11.rb x 3', "  x\n xxx\nxxxxx", 2, nb)

script = "air12"
nb = 2
full_test(script, 'ruby air12.rb 6 5 4 3 2 1', "1 2 3 4 5 6", 1, nb)
full_test(script, 'ruby air12.rb 1 45 89 3 64 0 100 13', "0 1 3 13 45 64 89 100", 2, nb)

puts "Total success: (#$global_ok/#$global_nb)"

