class Bingeworthy::Genres 
    attr_accessor :id, :name

    @@all = []

    def initialize(id, name)
        @id = id
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def find_show_by_genre(genre)
        TV_Shows.find_all {|show| show.genre == self}
        binding.pry
    end



end