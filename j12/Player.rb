class Player
  #TO DO : la classe a 3 attr_accessor, son nom, sa valeur (X ou O), et le fait d'avoir ou non gagné le game
  attr_accessor :name, :sign, :game_won
  
  def initialize
    # A chaque création d'instance de Player, on récupère en ligne de commande le nom et le signe choisi pour CE player particulier
    # On set aussi @game_won a false (losqu'un jouer gagne on passera la valeur de @game_won a true pour ce joueur)
    print "What is your name ? : "
    @name = gets.chomp
    print "Do you want to be 'X' or 'O' ? : "
    @sign = gets.chomp
    @game_won = false
  end
end

# On crée 2 instances de classe, que l'on stocke dans des variables globales pour y avoir accès de partout
$player_1 = Player.new
$player_2 = Player.new

# On garde egalement en mémoire les signes qu'on choisi les 2 joueurs, cela nous servira plus tard
$sign_of_player_1 = $player_1.sign
$sign_of_player_2 = $player_2.sign

# On garde egalement en mémoire les noms des joueurs
$name_of_player_1 = $player_1.name
$name_of_player_2 = $player_2.name