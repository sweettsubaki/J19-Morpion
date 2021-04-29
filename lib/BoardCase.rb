class BoardCase
    attr_accessor :used, :who_marked_the_case,

    def initialize
       @used = false #on crée un attribut pour dire que la case 
       #n'est plus disponible elle renvoi donc 'false'
       @who_marked_the_case = "" 
    end

    def moves(player)
#Le but est de marquer les cases selon les mouvements du joueur
        if !@used #si la case n'est pas utilisée = si elle est libre
            @used = true #la case peut donc renvoyer des données
            @who_marked_the_case = player
            return true
        else #si la case est déjà occupée
            puts "Cette case-ci a déjà été choisie, merci d'en choisir une autre"
            return false
        end
    end

    def who_marked_it
        if @used == true #si la case peut renvoyer des données
            #elle peut y inscrire la X ou le O
            return @who_marked_the_case.symbol
        end
        return " "
    end
end