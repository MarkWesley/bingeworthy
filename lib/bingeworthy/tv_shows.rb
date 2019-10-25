class Bingeworthy::TV_Shows
    attr_accessor :name, :genre, :overview

    @@all = []

    def initialize(name, genre, overview)
        @name = name
        @genre = genre
        @overview = overview
        @@all << self
    end

    def self.all 
        @@all
    end

end
