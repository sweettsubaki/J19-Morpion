class Application
    def self.game
        quit = false #on fait en sorte qu'on ne puisse pas quitter même si on a gagné
        game = Game.new() #on commence une nouvelle partie
        players = [game.player1, game.player2] #on utilise 2x le class Player
        total = (game.board.letters.length * game.board.letters.length) -1 
        #on créer un nombre total/max de coups à utiliser

        while quit == false
            victory = false
            game = Game.new(players)
            count = 0 #nombre de coups joués

            puts Show.board(game.board.board_case, game.board.letters, game.board.digits)
            #on affiche le plateau

            while count < total && victory == false #tant qu'on a 
                #pas gagné ou atteint le nombre de coups max
                players.each do |player|
                    while true
                        if game.moves(Show.moves(player), player)
                            count += 1
                            if count == total
                                puts "Impossible de terminer la partie"
                            end
                            break
                        end
                        puts Show.board(game.board.board_case, game.board.letters, game.board.digits)
                    end

                    if game.win(player)
                        Show.victory(player)
                        puts Show.board(game.board.board_case, game.board.letters, game.board.digits)
                        victory = true
                        break
                    end

                    puts Show.board(game.board.board_case, game.board.letters, game.board.digits)
                end
            end
            quit = Show.continue
        end
    end
end