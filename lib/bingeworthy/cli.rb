class Bingeworthy::CLI

    def call
        Bingeworthy::API.new.fetch_genre
        Bingeworthy::API.new.fetch_tv_shows
        start
    end

    def start
        puts "Welcome! Sweatpants on and snacks ready?? Great! Let's binge some TV."
        puts ""
        sleep(4)

        print_genres

        puts ""
        puts "Please select a genre by number to view all shows in that genre."
        input = gets.strip

        if valid?(input, @genres)
         get_id(input.to_i)
         print_tv_shows
        else
            puts "Sorry I didn't understand that."
            sleep(4)
            start
        end
    
        puts "Please select a show by number to view details."

        input = gets.strip
        if valid?(input, @show)
            print_details(input.to_i)
        else
            puts "Sorry I didn't understand that."
            sleep(4)
            start
        end

        input = gets.strip.downcase
            if input == "y"
                start
            elsif input == "n"
                puts "Thank you. Happy binging!!"
                exit
            else 
                puts "Sorry, I didn't understand that."
                start
            end

    end

    def valid?(input, array)
        if input == "exit"
            goodbye
        end
        input.to_i.between?(1, array.length)
    end

    def get_id(input)
       x = Bingeworthy::Genres.all[input-1]
        get_tv_shows(x.id)
    end

    def get_tv_shows(genre_id)
        @show = Bingeworthy::TV_Shows.all.select {|tv_show| tv_show.genre_id.include?(genre_id)}
    end

    def print_details(input)
      tv = @show[input-1]
        puts "Name: #{tv.name}"
        puts ""
        puts "Overview: #{tv.overview}"
        puts ""
        puts "Would you like to find another show? Enter Y/N "
     end


    def print_tv_shows
        if @show.empty?
            puts "There are no bingeworthy shows for this genre. Please select another option"
            sleep(5)
            start
        else
            @show.each_with_index do |tv_show, index|
             puts "#{index+1}. #{tv_show.name}"
            end
         end
    end

    def print_genres
       @genres = Bingeworthy::Genres.all.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.name}"
        end
    end
    
    def goodbye
        puts "Thank you. Happy binging!!"
        exit
    end

end
