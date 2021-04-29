class Show
    def self.require_player(player_number, symbol) 
        puts "**" * 35
        puts "**" * 35
        puts "**" + "Start Menu".center(66) + "**"
        puts "**" * 35
        puts "**" + " " * 66 + "**" 
        puts "**" + "Attributs du JOUEUR #{player_number}".center(66) + "**"
        puts "**" + "-----------".center(66) +"**"
        puts "**" + "Le jeton utilisé sera : #{symbol}".center(66) + "**"
        puts "**" + " " * 66 + "**"
        puts "**" * 35
        puts "**" * 35
        puts ""
        puts "Séléctionez votre nom de JOUEUR #{player_number}"
        print ">"
        return gets.chomp, symbol
    end

    def self.moves(player)
        puts "**" * 35
        puts "**" * 35
        puts "**" + "Moves Menu" + "**"
        puts "**" * 35
        puts "**" + " " * 66 + "**"
        puts "**" + "Joueur actuellement en jeu : #{player.name}".center(66) + "**"
        puts "**" + "-----------".center(66) + "**"
        puts "**" + "Quelle case souhaitez-vou marquer ?".center(66) + "**"
        puts "**" + " " * 66 + "**"
        puts "**" * 35
        puts "**" * 35
        puts ""
        puts "entrez l'adresse d'une case (ex: A1 ou c3) :"
        print ">"
        return gets.chomp.downcase #on remet tout en minuscule
    end

    def self.victory(player)
        puts "**" * 35
        puts "**" * 35
        puts "**" + "VICTOIRE".center(66) + "**"
        puts "**" * 35
        puts "**" + " " * 66 + "**"
        puts "**" + "Joueur actuellement en jeu : #{player.name}".center(66) + "**"
        puts "**" + "-----------".center(66) + "**"
        puts "**" + "Félicitations #{player.name} ! Vous vener de remporter cette partie".center(66) + "**"
        puts "**" + " " * 66 + "**"
        puts "**" * 35
        puts "**" * 35
    end

    def self.board(board_case, letters, digits) #on arrange donc le tableau
        puts "-------" + "-" * 21
        puts "  0  " + "-  A   -  B   -  C  -"
        
        digits.each do |digit| #on commence par les colonnes de chiffres
            height = "-------" #permet de noter la séparation en ht de chaque ligne
            middle = "  #{digit}  "

            letters.each do |letter| #auxquelles on ajoute les lignes de lettres pour en faire un tableau
                symbol = board_case[letter + digit].who_marked_it
                #les symboles se trouvent dans la board case, au croisement ligne/colonne
                #et on appelle la méthode pour marquer X/O
                height += "-------" 
                middle += "-  #{symbol}  -"
            end
            puts height
            puts middle
        end
        puts "-------" + "-" * 21
    end

    def self.continue
        puts "**" * 35
        puts "**" * 35
        puts "**" + "Menu Abandon".center(66) + "**"
        puts "**" * 35
        puts "**" + " " * 66 + "**"
        puts "**" + "Voulez-vous quitter le jeu ?".center(66) + "**"
        puts "**" + "-----------".center(66) + "**"
        puts "**" + "Les joueurs restent les même que ceux actuellement en jeu".center(66) + "**"
        puts "**" + " " * 66 + "**"
        puts "**" * 35
        puts "**" * 35
        puts ""
        puts "Souhaitez-vous quitter le jeu ? O/N"
        print ">"
        réponse = gets.chomp
        (réponse.downcase == "O") ? (return true) : (return false)
    end 

end