class Bingeworthy::CLI

    def start
        puts "Welcome! Sweatpants on and snacks ready?? Great! Let's get started."
        puts "Please select a genre by number to view all shows in that genre."
        Bingeworthy::API.new.fetch_genre
        Bingeworthy::Genres.all.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.id}"
        end
    end
    
    def call
        Bingeworthy::API.new.fetch_genre
        Bingeworthy::Genres.all.each do |genre|
            puts genre.id
            puts genre.name
        end

        Bingeworthy::API.new.fetch_tv_shows
        Bingeworthy::TV_Shows.all.each do |tv_show|
            puts tv_show.name
            puts tv_show.genre
            puts tv_show.overview
        end
    end

 

end