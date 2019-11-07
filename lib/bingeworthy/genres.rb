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

    def tv_genres 
        TV_Genres.all.select {|tv| tv.genre== self}
    end

    def tv_shows 
        tv_genres.map {|tv| tv.tv_show}
    end

end