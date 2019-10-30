class Bingeworthy::CLI

    def call
        Bingeworthy::API.new.fetch_genre
        Bingeworthy::API.new.fetch_tv_shows
        start
    end

    def start
        puts "Welcome! Sweatpants on and snacks ready?? Great! Let's binge some TV."
        puts ""
        print_genres
        puts ""
        puts "Please select a genre by number to view all shows in that genre."
        input = gets.strip

        #Need to find a way to ensure that user input is only integers 1-19 for genre selection and if not, it should return the user to start
        get_id(input.to_i)

        print_tv_shows
    
        puts "Please select a show by number to view details."

        input = gets.strip
        print_details(input.to_i)

        input = gets.strip.downcase
            if input == "y"
                start
            elsif input == "n"
                puts "Thank you. Have a nice day."
                exit
            else 
                puts "Sorry, I didn't understand that."
                start
            end

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
        puts "Overview: #{tv.overview}"
        puts ""
        puts "Would you like to find another show? Enter Y/N "
     end


    def print_tv_shows
        if @show.empty?
            puts "There are no bingeworthy shows for this genre. Please select another option"
            sleep(2)
            start
        else
            @show.each_with_index do |tv_show, index|
             puts "#{index+1}. #{tv_show.name}"
            end
         end
    end

    def print_genres
        Bingeworthy::Genres.all.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.name}"
        end
    end
    


 

end
