class Bingeworthy::TV_Shows
    attr_accessor :name, :overview

    @@all = []

    def initialize(name, overview)
        @name = name
        @overview = overview
        @@all << self
    end

    def self.all 
        @@all
    end

    def new_tv_genre(genre)
        TV_Genres.new(genre, self)
    end

    def tv_genres 
        TV_Genres.all.select {|tv| tv.tv_show == self}
    end

    def genres 
        tv_genres.map {|tv| tv.genre}
    end



end
