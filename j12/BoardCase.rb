class BoardCase
  # La classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
  # On initialise aussi un compteur qui va nous permettre de numéroter chacune des cases
  attr_accessor :value, :case_num
  @@count = 1
  
  def initialize
    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @value = "."
    @case_num = @@count
    @@count += 1
  end
  
  def to_s
    # Renvoie la valeur au format string
    return @value.to_s
  end

end