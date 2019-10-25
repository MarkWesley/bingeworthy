class Bingeworthy::API

    def initialize
        @key = "82879be7a61e78643d9c4e8ac32335ea"
    end

    def fetch_genre
        url = 'https://api.themoviedb.org/3/genre/movie/list?language=en-US&api_key=82879be7a61e78643d9c4e8ac32335ea'
        response = HTTParty.get(url)
        response["genres"].each do |genre|
            id = genre["id"] 
            name = genre["name"]
            Bingeworthy::Genres.new(id, name)
        end
    end

    def fetch_tv_shows
        url = 'https://api.themoviedb.org/3/tv/popular?page=1&language=en-US&api_key=82879be7a61e78643d9c4e8ac32335ea'
        response = HTTParty.get(url)
        response["results"].each do |tv_show|
            name = tv_show["original_name"]
            genre = tv_show["genre_ids"]
            overview = tv_show["overview"]
            Bingeworthy::TV_Shows.new(name, genre, overview)
        end
    end

end
