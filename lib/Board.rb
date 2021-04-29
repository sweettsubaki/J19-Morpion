class Board
    attr_accessor :board_case, :letters, :digits
   
    def initialize
        @board_case = {}
        # #Un plateau de morpion est composé de 3 colonnes et 3 lignes.
        # Ici on va se baser sur l'organisation des batailles navales et des
        # plans en considérant que les colonnes sont des lettres et 
        # les lignes des chiffres.
        @letters = ['a', 'b', 'c']
        @digits = ['1', '2', '3']

        @letters.each do |letter|
            @digits.each do |digit|
                @board_case[letter + digit] = BoardCase.new
        #On fait le tour de chaque array pour ensuite les lier 
        #en tableau (croisement ligne+colone) dans Boardcase
            end
        end

    end

end