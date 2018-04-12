require 'pry'
require 'set'
require_relative 'BoardCase'
require_relative 'Player'

# La Class Array : petit bout de code qui m'empeche une erreur aux lignes 91 et 96
# J'ai trouvé ce bout de code ici : https://apidock.com/ruby/Array/include%3F
class Array
  def included_in? array
    array.to_set.superset?(self.to_set)
  end
end

class Board
  include Enumerable
  # La classe a 1 attr_accessor, une array qui contient les BoardCases
  # On initialise un autre compteur
  attr_accessor :arr
  @@other_count = 1

  def initialize
    #TO DO :
    #Quand la classe s'initialize, va créer 9 instances BoardCases (grace a notre compteur)
    #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @arr = []
    while @@other_count <= 9 do
      @arr << BoardCase.new
      @@other_count += 1
    end
  end

  def to_s
  # Afficher le plateau
  puts 
  puts arr[0].to_s + "   " + arr[1].to_s + "   " + arr[2].to_s
  puts 
  puts arr[3].to_s + "   " + arr[4].to_s + "   " + arr[5].to_s
  puts 
  puts arr[6].to_s + "   " + arr[7].to_s + "   " + arr[8].to_s
  puts

  end

  # On initialise un nouveau compteur ainsi qu'un array. Ces variables sont des variables globales 
  # définies hors de la méthode pour éviter d'etre écrasées a chaques fois que l'on appelle cette méthode
  $signcount = 0
  $cases_already_played = []
  def play
    # Méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    # On utilise le % 2 pour que le tour des joueurs soit alterné
    if $signcount % 2 == 0 then print "#{$name_of_player_1}, where do you want to play ? (1-9) "
    else print "#{$name_of_player_2}, where do you want to play ? (1-9) " 
    end

    # On demande quelle case le joueur a envie de remplir, et on récupère ce choix sous la forme d'un int 
    #(le - 1 permet de passer d'un index "humain" a un index "ruby") ==> Aucun joueur ne dira qu'il veut jouer dans la case 0 !! 
    case_played = gets.chomp.to_i - 1

    # On vérifie que la case ou le joueur veut mettre son symbole est bien disponible
    while $cases_already_played.include?(case_played)
      print "You can't play here, please chose another spot ! (1-9) " 
      case_played = gets.chomp.to_i - 1
    end  

    # On garde en mémoire toutes les cases jouées
    $cases_already_played << case_played
    
    # Si toutes les cases sont remplies et que personne n'a gagné, c'est un match nul !
    if $cases_already_played.size == 9 && $player_1.game_won = false && $player_2.game_won = false
      puts "Match nul !"
      exit 
    end
    
    # Permet de savoir quel signe inscrire (X ou O)
    if $signcount % 2 == 0
      sign = $sign_of_player_1
      $signcount += 1
      @arr[case_played] = sign
    else
      sign = $sign_of_player_2
      $signcount += 1
      @arr[case_played] = sign

  end

  end

  def victory(my_board, player_1, player_2)

    # Liste des positions gagnantes
    winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    # Garde en mémoire la position de tous les "X" et de tous les "O"
    # location_P1 et location_P2 sont 2 arrays qui contiennent respectivement les index
    # de toutes les positions du player 1 et du player 2
    location_P1 = my_board.arr.each_index.select{|i| my_board.arr[i] == $sign_of_player_1}
    location_P2 = my_board.arr.each_index.select{|i| my_board.arr[i] == $sign_of_player_2}

    # Si le Player 1 possède 1 des 8 elements de winning_combo, alors Player 1 a gagné
     winning_combos.each do |element|
      if element.included_in?(location_P1) then player_1.game_won = true
      end
    end

    # Si le Player 2 possède 1 des 8 elements de winning_combo, alors Player 2 a gagné
    winning_combos.each do |element|
      if element.included_in?(location_P2) then player_2.game_won = true
      end
    end

    # Si Player 1 a gagné, lui indiquer que c'est le cas et quitter le programme
    if player_1.game_won == true then
      puts "#{$player_1.name} won the game"
      exit
    end

    # Si Player 2 a gagné, lui indiquer que c'est le cas et quitter le programme
    if player_2.game_won == true then
      puts "#{$player_2.name} won the game"
      exit
    end

  end
end

# Crée une instance de Board et le display
my_board = Board.new
my_board.to_s

# Boucle infini qui permet de continuer de jeu tant qu'aucune condition d'arret n'a été croisée
while true do
  my_board.play
  my_board.to_s
  my_board.victory(my_board, $player_1, $player_2)
end
