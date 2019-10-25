class Bingeworthy::Genres 
    attr_accessor :id, :name

    @@all = []

    def initialize(name, id)
        @id = id
        @name = name
        @@all << self
    end

    def self.all
        @@all 
    end


end