class Bingeworthy::Genres 
    attr_accessor :name, :id

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