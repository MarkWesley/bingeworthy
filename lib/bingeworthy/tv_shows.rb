class Bingeworthy::TV_Shows
    attr_accessor :name, :genre_id, :overview

    @@all = []

    def initialize(name, genre_id, overview)
        @name = name
        @genre_id = genre_id
        @overview = overview
        @@all << self
    end

    def self.all 
        @@all
    end



end
