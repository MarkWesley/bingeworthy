class Bingeworthy::Genres 
    attr_accessor :id, :name
    attr_reader :tv_shows

    @@all = []

    def initialize(id, name)
        @id = id
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end

    def new_tv_genre(tv_show)
        TV_Genres.new(tv_show, self)
    end

    def tv_genres 
        TV_Genres.all.select {|tv| tv.genre== self}
    end

    def tv_shows 
        @tv_shows = tv_genres.map {|tv| tv.tv_show}
    end

end