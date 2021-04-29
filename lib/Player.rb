class Player
    attr_accessor :name, :count_strokes, :symbol

    def initialize(symbol_name_array)
        @name = symbol_name_array[0]
        @symbol = symbol_name_array[1]
        @count_strokes = 0
        #permet d'initialiser un array où on place le nom du joueur, 
        #son symbole ainsi que le nombre de coup joués
    end
end