class TV_Genres
    attr_accessor :genre, :tv_show

    @@all = []

    def initialize(genre, tv_show)
        @genre = genre
        @tv_show = tv_show
        @@all << self
    end

    def self.all
        @@all
    end


end
