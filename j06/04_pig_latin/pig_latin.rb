#write your code here
def translate(words)
 vowels = "aeiouyAEIOUY"
 single_words = words.split(" ") # transforme le string passé en paramètre 'words' en array
 translated_words = single_words.map do |word|
   if vowels.include?(word[0]) # Si la première lettre du mot a l'index auquel on est commence par une voyelle
     word + "ay"
   else
     word_starts_with_consonant(word)
   end
end
 return translated_words.join(" ") # Re-transforme l'array en string
end

def word_starts_with_consonant(word)
 
 vowels = "aeioyAEIOY" # Pas de "U" dans les voyelles pour compter "qu" en temps que consomne
 consonants = ""
 word_vowels = ""
 vowel_index = 0
 
 word_char_array = word.split(//) # transforme le string passé en paramètre en un array de chars
 
 word_char_array.each_with_index do |letter,index| # Pour travailler sur chaque lettre de l'array on leur donne un index
 	
   unless (vowels.include?(letter)) # Si la lettre a l'index auquel on est n'est pas une voyelle, ajouter cette lettre au string consonants
     consonants += letter
   else # Sinon la lettre a l'index auquel on est est une voyelle, donc on enregistre l'index de cette lettre(la première voyelle du mot) dans vowel_index
     vowel_index = index
     break
   end
 end
 word_vowels += word[(vowel_index..-1)] # De la première voyelle à la fin du string
 full_word = word_vowels + consonants + 'ay'
 # Full word est juste la pour la lisibilité
 return full_word
end
