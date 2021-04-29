class Game
#c'est la classe jeu où on va mettre la plupart des 'coups'
    attr_accessor :player1, :player2, :board

    def initialize(players = false) #on part du principe qu'il n'y a pas 
        #encore de joueurs au début de la partie. donc l'array est false
        #"l'idée de jouer existe mais on ne sait pas encore qui va jouer"
        if players == false #il n'y a pas de joueurs alors on va 
        #les créer en appelant l'init de Player
            @player1 = Player.new(Show.require_player('1', "X"))
            @player2 = Player.new(Show.require_player('2', "O"))
        else
            #si les joueurs sont créés ils sont placés dans l'array players
            @player1 = players [0] 
            @player2 = players [1]
        end

        #les joueurs sont prêt alors on sort le plateau
        @board = Board.new
    end

    def moves(target, player) #on part dans le système bataille navale 
        #où le joueur doit atteindre une cible
        if @board.board_case.has_key?(target) #est-ce que la case 
            #target existe sur le plateau ? Si oui : 
            @board.board_case[target].moves(player) #on lui assigne 
            #le joueur qui l'a marquée
        else #si non (erreur de l'utilisateur):
            puts "Erreur, veuillez spécifier une case placée sur le plateau SVP"
            return false
        end
    end

    def win(player) #on test pour savoir s'il y a un gagnant après le dernier coup
        letters = @board.letters
        digits = @board.digits

        #On vérifie les colonnes en créant marked
        letters.each do |letter|
            marked = 0
            digits.each do |digit| #chaque colonne a ses lignes 
                #donc on les parcours ensemble.
                if @board.board_case[letter + digit].who_marked_the_case == player
                    marked += 1
                    #on test pour savoir si il y a un alignement par joueur
                end
            end
            return true, player if marked == letters.length #renvoyer true si l'array
            #letter est bien marqué partout
            marked = 0
        end

         #On vérifie les lignes
        digits.each do |digit|
            marked = 0
            letters.each do |letter|
                if @board.board_case[letter + digit].who_marked_the_case == player
                    marked += 1
                end
            end
            return true, player if marked == letters.length
            marked = 0
        end

        #On vérifie les deux diagonales
        marked1 = 0
        marked2 = 0
        i = 0
        letters.length.times do
            if @board.board_case[letters[i] + digits[i]].who_marked_the_case == player
                marked1 += 1 #on avance de gauche à droite /de haut en bas
            end
            if @board.board_case[letters[letters.length - (i + 1)] + digits[i]].who_marked_the_case == player
                marked2 += 1 #droite à gauche haut en bas
            end
            i += 1
        end
        return true, player if marked1 == letters.length || marked2 == letters.length
        return false
    end
end